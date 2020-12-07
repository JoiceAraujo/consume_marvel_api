import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';

class SearchCharactersScreen extends StatefulWidget {
  static const String route = '/search_characters_screen';

  @override
  _SearchCharactersScreenState createState() => _SearchCharactersScreenState();
}

class _SearchCharactersScreenState extends State<SearchCharactersScreen> {
  final TextEditingController _nameCharacter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(15.0),
      left: true,
      right: true,
      top: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _nameCharacter,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: 'Character name',
              border: OutlineInputBorder(),
            ),
          ),
          FlatButton(
            child: Text(
              'Search Character',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () async {
              CharactersApiController ctrl =
                  Provider.of<CharactersApiController>(context, listen: false);

              await ctrl.characters(_nameCharacter.text);
            },
          )
        ],
      ),
    );
  }
}
