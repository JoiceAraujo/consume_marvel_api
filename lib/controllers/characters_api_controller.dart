import 'package:flutter/cupertino.dart';

import '../models/character.dart';
import '../services/characters_api_service.dart';

class CharactersApiController extends ChangeNotifier {
  final CharacterApiService marvelApiService = CharacterApiService();
  CharactersState charactersState = CharactersState.undefined;
  List<Character> charactersList = [];
  Character character;
  int offset = 0;

  void init() async {
    charactersState = CharactersState.loading;
    notifyListeners();

    List<Character> tempList = await marvelApiService.getListCharacters(offset);

    for (Character character in tempList) {
      character.imageLink = marvelApiService.getImageLinks(character);
    }

    for (Character character in tempList) {
      charactersList.add(character);
    }

    offset = offset + 10;

    charactersState = CharactersState.listReady;
    notifyListeners();
  }

  Future<void> getCharactersList() async {
    charactersState = CharactersState.loading;
    notifyListeners();

    List<Character> tempList = await marvelApiService.getListCharacters(offset);

    for (Character character in tempList) {
      character.imageLink = marvelApiService.getImageLinks(character);
    }

    for (Character character in tempList) {
      charactersList.add(character);
    }

    offset = offset + 10;

    charactersState = CharactersState.listReady;
    notifyListeners();
  }

  Future<void> getCharacterByName(String name) async {
    charactersState = CharactersState.loading;
    notifyListeners();

    character = await marvelApiService.searchCharacter(name);

    if (character != null) {
      character.imageLink = marvelApiService.getImageLink(character);

      charactersState = CharactersState.characterReady;
    } else {
      charactersState = CharactersState.error;
    }

    notifyListeners();
  }

  void getBackToSearch() {
    charactersState = CharactersState.listReady;
    notifyListeners();
  }

  void cleanList() {
    charactersList = [];
    offset = 0;
  }
}

enum CharactersState {
  loading,
  characterReady,
  listReady,
  error,
  undefined,
}
