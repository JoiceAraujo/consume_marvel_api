import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';
import '../screens/search_characters_screen.dart';
import '../utils/errors.dart';
import 'character_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersApiController>(
      builder: (context, ctrl, child) {
        switch (ctrl.charactersState) {
          case CharactersState.ready:
            return CharacterScreen();
          case CharactersState.loading:
            return Center(child: CircularProgressIndicator());
          case CharactersState.error:
            return AlertDialog(
              title: Text('Error'),
              content: Container(
                height: 40.0,
                width: 230.0,
                child: Text(Errors.characterNotFound),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    Provider.of<CharactersApiController>(context, listen: false)
                        .getBackToSearch();
                  },
                ),
              ],
            );
          case CharactersState.searching:
            return SearchCharactersScreen();
          default:
            return Center(
              child: Text('Default'),
            );
        }
      },
    );
  }
}
