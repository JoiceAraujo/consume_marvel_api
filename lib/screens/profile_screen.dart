import 'package:consume_marvel_api/controllers/account_controller.dart';
import 'package:consume_marvel_api/controllers/profile_controller.dart';
import 'package:consume_marvel_api/models/profile.dart';
import 'package:consume_marvel_api/widgets/elevated_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    final ProfileController ctrlProfile =
        Provider.of<ProfileController>(context);
    final AccountController accountController =
        Provider.of<AccountController>(context, listen: false);
    final List<Profile> profileList = ctrlProfile.profilesList;

    return Column(
      children: [
        ElevatedButtonCustom(
          'Sign Out',
          () {
            accountController.signOut();
          },
        ),
        ListView.builder(
          itemCount: profileList.length,
          itemBuilder: (context, index) {
            return ElevatedButtonCustom(
              profileList[index].name,
              () {
                ctrlProfile.changeProfile(profileList[index]);
              },
            );
          },
        ),
      ],
    );
  }
}
