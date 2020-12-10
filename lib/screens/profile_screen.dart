import 'package:consume_marvel_api/utils/errors.dart';
import 'package:consume_marvel_api/widgets/alert_dialog_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/account_controller.dart';
import '../controllers/profile_controller.dart';
import '../models/profile.dart';
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
        Provider.of<ProfileController>(context);
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
                  onPressed: () {
                    ctrlProfile.deleteProfile(profile);
                    if (ctrlProfile.state == ProfileState.error) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialogError(
                                'ERROR', Errors.deleteMainProfile);
                          });
                    } else {
                      profileList = ctrlProfile.profilesList;
                    }
                  },
                ),
                onTap: () {},
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

// ListView.builder(
//   itemCount: profileList.length,
//   shrinkWrap: true,
//   itemBuilder: (context, index) {
//     return ElevatedButtonCustom(
//       profileList[index].name,
//       () {
//         ctrlProfile.changeProfile(profileList[index]);
//       },
//     );
//   },
// ),

//   ElevatedButtonCustom(
//   profile.name,
//   () {
//     ctrlProfile.changeProfile(profile);
//   },
// );
