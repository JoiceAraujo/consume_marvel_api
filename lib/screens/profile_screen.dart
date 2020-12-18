import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/account_controller.dart';
import '../controllers/profile_controller.dart';
import '../models/profile.dart';
import '../utils/errors.dart';
import '../widgets/alert_dialog_error.dart';
import '../widgets/elevated_button_custom.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = '/profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ProfileController ctrlProfile =
        Provider.of<ProfileController>(context, listen: true);
    final AccountController accountController =
        Provider.of<AccountController>(context, listen: false);
    List<Profile> profileList = ctrlProfile.profilesList;

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: profileList.map((profile) {
              return ListTile(
                title: Text(profile.name),
                trailing: IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    await ctrlProfile.deleteProfile(profile);
                    if (ctrlProfile.state == ProfileState.error) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialogError(
                              'ERROR', Errors.deleteMainProfile);
                        },
                      );
                    } else {
                      profileList = await ctrlProfile.profilesList;
                    }
                  },
                ),
                onTap: () {
                  ctrlProfile.changeProfile(profile);
                },
                visualDensity: VisualDensity.comfortable,
              );
            }).toList(),
          ),
          ElevatedButtonCustom(
            'Sign Out',
            () {
              accountController.signOut();
            },
          ),
        ],
      ),
    );
  }
}
