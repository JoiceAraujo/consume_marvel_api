import 'package:dio/dio.dart';

import '../models/character.dart';
import '../utils/constants.dart';
import '../utils/errors.dart';

class CharacterApiService {
  static final Dio dio = Dio();

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
      print(Errors.characterNotFound);
      return null;
    }
  }

  Future<String> getImageLink(Character character) async {
    return Constants.imageCharacter
        .replaceFirst('{path}', '${character.thumbnailPath}')
        .replaceFirst('{extension}', '${character.thumbnailExtension}');
  }
}
