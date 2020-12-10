import 'package:consume_marvel_api/controllers/account_controller.dart';
import 'package:consume_marvel_api/controllers/profile_controller.dart';
import 'package:consume_marvel_api/utils/validations.dart';
import 'package:consume_marvel_api/widgets/text_form_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertDialogAddProfile extends StatelessWidget {
  final TextEditingController ctrlText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextCapitalization capitalization;
  final String titleAlert;
  final String labelText;

  AlertDialogAddProfile({
    @required this.titleAlert,
    @required this.capitalization,
    @required this.labelText,
  });

  String validation(String name) {
    return Validations().nameIsValid(ctrlText.text);
  }

  @override
  Widget build(BuildContext context) {
    final ProfileController ctrlProfile =
        Provider.of<ProfileController>(context, listen: false);
    final AccountController ctrlAccount =
        Provider.of<AccountController>(context, listen: false);

    return AlertDialog(
      title: Text(titleAlert),
      content: Form(
        key: _formKey,
        child: TextFormFieldCustom(
          ctrlText,
          validation,
          capitalization,
          labelText,
          true,
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Add Profile'),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ctrlProfile.createProfile(ctrlAccount.account, ctrlText.text);
            }
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
