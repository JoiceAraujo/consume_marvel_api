import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';
import '../screens/character_list_screen.dart';
import '../screens/character_screen.dart';

class HomeCharacterScreen extends StatefulWidget {
  static const String route = '/home_character_screen';

  @override
  _HomeCharacterScreenState createState() => _HomeCharacterScreenState();
}

class _HomeCharacterScreenState extends State<HomeCharacterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CharactersApiController>(
      builder: (context, ctrl, child) {
        switch (ctrl.charactersState) {
          case CharactersState.characterReady:
            return CharacterScreen();

          case CharactersState.loading:
            return Center(child: CircularProgressIndicator());

          case CharactersState.error:
            return Container();

          case CharactersState.listReady:
            return CharacterListScreen();

          default:
            return Container();
        }
      },
    );
  }
}
