import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/account_controller.dart';
import '../controllers/profile_controller.dart';
import '../utils/errors.dart';
import '../utils/validations.dart';
import '../widgets/alert_dialog_error.dart';
import '../widgets/text_form_field_custom.dart';

class AlertDialogAddProfile extends StatefulWidget {
  final TextCapitalization capitalization;
  final String titleAlert;
  final String labelText;

  AlertDialogAddProfile({
    @required this.titleAlert,
    @required this.capitalization,
    @required this.labelText,
  });

  @override
  _AlertDialogAddProfileState createState() => _AlertDialogAddProfileState();
}

class _AlertDialogAddProfileState extends State<AlertDialogAddProfile> {
  final TextEditingController ctrlText = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      title: Text(widget.titleAlert),
      content: Form(
        key: _formKey,
        child: TextFormFieldCustom(
          ctrlText,
          validation,
          widget.capitalization,
          widget.labelText,
          true,
        ),
      ),
      actions: [
        FlatButton(
          child: Text('Add Profile'),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              await ctrlProfile.createProfile(
                  ctrlAccount.account, ctrlText.text);
              if (ctrlProfile.state == ProfileState.error) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogError('Erros', Errors.existingProfile);
                  },
                );
              } else {
                Navigator.pop(context);
              }
            }
          },
        ),
      ],
    );
  }
}
