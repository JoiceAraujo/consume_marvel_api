import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';
import '../models/character.dart';
import '../widgets/character_card.dart';

class CharacterListScreen extends StatefulWidget {
  static const String route = '/character_list_screen';
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  final ScrollController _scrollController = ScrollController();

  void getMoreData(CharactersApiController ctrl) async {
    await ctrl.getCharactersList();
  }

  @override
  Widget build(BuildContext context) {
    CharactersApiController ctrl =
        Provider.of<CharactersApiController>(context, listen: false);

    Widget buildGridView() {
      List<Character> characterList = ctrl.charactersList;

      return GridView.count(
        controller: _scrollController,
        padding: const EdgeInsets.all(10.0),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: characterList.map((character) {
          return InkWell(
            child: CharacterCard(character.name, character.imageLink),
            onTap: () {},
          );
        }).toList(),
      );
    }

    _scrollController.addListener(() async {
      double maxScrollExtent = _scrollController.position.maxScrollExtent;

      if (maxScrollExtent == _scrollController.offset) {
        await getMoreData(ctrl);
        setState(() {
          return buildGridView();
        });
      }
    });

    return buildGridView();
  }
}
