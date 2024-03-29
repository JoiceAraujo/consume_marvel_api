import 'package:consume_marvel_api/controllers/account_controller.dart';
import 'package:consume_marvel_api/screens/index_screen.dart';
import 'package:consume_marvel_api/screens/sign_in_screen.dart';
import 'package:consume_marvel_api/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../controllers/characters_api_controller.dart';
// import '../screens/search_characters_screen.dart';
// import '../utils/errors.dart';
// import 'character_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountController>(
      builder: (context, ctrl, child) {
        switch (ctrl.accountState) {
          case AccountState.unauthenticated:
            return SignInScreen();
          case AccountState.authenticated:
            return IndexScreen();
          case AccountState.authenticating:
            return Container(
              child: Center(child: CircularProgressIndicator()),
              color: Colors.white70,
            );
          case AccountState.error:
            return SignUpScreen();
          default:
            return SignInScreen();
        }
      },
    );
  }
}
