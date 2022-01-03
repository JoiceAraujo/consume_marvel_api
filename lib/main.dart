import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/account_controller.dart';
import 'controllers/characters_api_controller.dart';
import 'controllers/profile_controller.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ignore: unnecessary_statements
        ChangeNotifierProvider(
            create: (_) => CharactersApiController()..init()),
        ChangeNotifierProvider(create: (_) => AccountController()..init()),
        ChangeNotifierProvider(create: (_) => ProfileController()..init()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.black54,
        ),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
