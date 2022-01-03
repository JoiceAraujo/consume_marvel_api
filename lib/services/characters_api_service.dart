import 'package:dio/dio.dart';

import '../models/character.dart';
import '../utils/constants.dart';

class CharacterApiService {
  static final Dio dio = Dio();
  int offSet = 0;

  Future<List<Character>> getListCharacters(int offset) async {
    dio.options.baseUrl =
        Constants.charactersList.replaceFirst('{offset}', offset.toString());
    Response response = await dio.get('');
    List<Character> charactersList = [];

    try {
      if (response.statusCode == 200 &&
          response.data['data']['results'].isNotEmpty) {
        for (Map<String, dynamic> character in response.data['data']
            ['results']) {
          charactersList.add(Character.fromMap(character));
        }

        return charactersList;
      } else {
        return null;
      }
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<Character> searchCharacter(String name) async {
    try {
      dio.options.baseUrl =
          Constants.characters.replaceFirst('{name}', '$name');
      Response response = await dio.get('');

      if (response.statusCode == 200 &&
          response.data['data']['results'].isNotEmpty) {
        return Character.fromMap(response.data['data']['results'].first);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  String getImageLink(Character character) {
    return Constants.imageCharacter
        .replaceFirst('{path}', '${character.thumbnailPath}')
        .replaceFirst('{extension}', '${character.thumbnailExtension}');
  }

  String getImageLinks(Character character) {
    return Constants.imageCharacter
        .replaceFirst('{path}', '${character.thumbnailPath}')
        .replaceFirst('{extension}', '${character.thumbnailExtension}');
  }
}
