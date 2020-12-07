import 'package:consume_marvel_api/screens/character_screen.dart';
import 'package:consume_marvel_api/screens/home_screen.dart';
import 'package:consume_marvel_api/screens/search_characters_screen.dart';

class RoutesApp {
  static const initialRoute = HomeScreen.route;
  static final routes = {
    HomeScreen.route: (context) => HomeScreen(),
    SearchCharactersScreen.route: (context) => SearchCharactersScreen(),
    CharacterScreen.route: (context) => CharacterScreen(),
  };
}
