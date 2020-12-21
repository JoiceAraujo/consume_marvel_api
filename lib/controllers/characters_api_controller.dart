import 'package:flutter/cupertino.dart';

import '../models/character.dart';
import '../services/characters_api_service.dart';

class CharactersApiController extends ChangeNotifier {
  final CharacterApiService marvelApiService = CharacterApiService();
  CharactersState charactersState = CharactersState.searching;
  List<Character> charactersList = [];
  Character character;
  String characterImageLink;

  Future<void> getCharactersList(int offset) async {
    charactersState = CharactersState.loading;
    notifyListeners();

    charactersList = await marvelApiService.getListCharacters(offset);

    charactersState = CharactersState.ready;
    notifyListeners();
  }

  Future<void> characters(String name) async {
    charactersState = CharactersState.loading;
    notifyListeners();

    character = await marvelApiService.searchCharacter(name);

    if (character != null) {
      characterImageLink = await marvelApiService.getImageLink(character);
      charactersState = CharactersState.ready;
    } else {
      charactersState = CharactersState.error;
    }

    notifyListeners();
  }

  void getBackToSearch() {
    charactersState = CharactersState.searching;
    notifyListeners();
  }
}

enum CharactersState {
  loading,
  ready,
  error,
  undefined,
  searching,
}
