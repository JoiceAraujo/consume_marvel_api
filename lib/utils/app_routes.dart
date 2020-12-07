import '../screens/character_screen.dart';
import '../screens/home_screen.dart';
import '../screens/index_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_characters_screen.dart';

class AppRoutes {
  static const initialRoute = IndexScreen.route;
  static final routes = {
    HomeScreen.route: (context) => HomeScreen(),
    SearchCharactersScreen.route: (context) => SearchCharactersScreen(),
    CharacterScreen.route: (context) => CharacterScreen(),
    IndexScreen.route: (context) => IndexScreen(),
    ProfileScreen.route: (context) => ProfileScreen(),
  };
}
