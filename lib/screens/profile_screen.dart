import 'package:consume_marvel_api/controllers/profile_controller.dart';
import 'package:consume_marvel_api/widgets/elevated_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    final List<Profile> profileList = Provider.of<ProfileController>(context).

    return Column(
      children: [
        ElevatedButtonCustom('titleButton', () {}),
        ListView(),
      ],
    );
  }
}
