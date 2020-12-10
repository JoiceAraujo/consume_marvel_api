import 'package:consume_marvel_api/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';
import '../screens/profile_screen.dart';
import '../screens/search_characters_screen.dart';

class IndexScreen extends StatefulWidget {
  static const String route = '/index_screen';
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final List<Widget> _screens = [
    SearchCharactersScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget getLeading(BuildContext context) {
    final CharactersApiController ctrlCharacters =
        Provider.of<CharactersApiController>(context);

    switch (ctrlCharacters.charactersState) {
      case CharactersState.ready:
        return IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Provider.of<CharactersApiController>(context, listen: false)
                .getBackToSearch();
          },
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController ctrlProfile =
        Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(ctrlProfile.profile.name),
        leading: getLeading(context),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
