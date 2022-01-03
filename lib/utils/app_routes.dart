import '../screens/character_list_screen.dart';
import '../screens/character_screen.dart';
import '../screens/home_characters_screen.dart';
import '../screens/home_screen.dart';
import '../screens/index_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.route;
  static final routes = {
    HomeScreen.route: (context) => HomeScreen(),
    HomeCharacterScreen.route: (context) => HomeCharacterScreen(),
    CharacterScreen.route: (context) => CharacterScreen(),
    CharacterListScreen.route: (context) => CharacterListScreen(),
    IndexScreen.route: (context) => IndexScreen(),
    ProfileScreen.route: (context) => ProfileScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    SignUpScreen.route: (context) => SignUpScreen(),
  };
}
