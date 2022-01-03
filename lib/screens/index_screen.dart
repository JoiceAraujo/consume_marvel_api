import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/characters_api_controller.dart';
import '../controllers/profile_controller.dart';
import '../screens/home_characters_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/alert_dialog_add_profile.dart';

class IndexScreen extends StatefulWidget {
  static const String route = '/index_screen';
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final List<Widget> _screens = [
    HomeCharacterScreen(),
    ProfileScreen(),
  ];
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget getFloatActionButton(BuildContext context, int index) {
    if (index == 1) {
      return FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 20.0,
          color: Colors.white,
        ),
        elevation: 7.0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialogAddProfile(
                titleAlert: 'Add the name of Profile',
                capitalization: TextCapitalization.words,
                labelText: 'Name',
              );
            },
          );
        },
      );
    } else {
      return null;
    }
  }

  Widget getLeading(BuildContext _) {
    CharactersApiController ctrl = Provider.of<CharactersApiController>(_);

    switch (ctrl.charactersState) {
      case CharactersState.characterReady:
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ctrlProfile.profile.name),
          leading: getLeading(context),
        ),
        floatingActionButton: getFloatActionButton(context, _currentIndex),
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
      ),
    );
  }
}
