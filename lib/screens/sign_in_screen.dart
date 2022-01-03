import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controllers/account_controller.dart';
import '../screens/sign_up_screen.dart';
import '../utils/errors.dart';
import '../utils/validations.dart';
import '../widgets/alert_dialog_error.dart';
import '../widgets/elevated_button_custom.dart';
import '../widgets/text_field_custom.dart';

class SignInScreen extends StatefulWidget {
  static const String route = '/sign_in_screen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AccountController ctrlAccount =
        Provider.of<AccountController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Marvel API')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldCustom(_emailCtrl, TextCapitalization.none, 'Email'),
          SizedBox(height: 10.0),
          TextFieldCustom(_passwordCtrl, TextCapitalization.none, 'Password'),
          Container(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
            ),
            alignment: Alignment.topLeft,
            child: FlatButton(
              child: Text('''Don't have an account? SignUp'''),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.route);
              },
            ),
          ),
          ElevatedButtonCustom(
            'SignIn',
            () {
              if (Validations()
                  .credentialsIsNotEmpty(_emailCtrl.text, _passwordCtrl.text)) {
                if (Validations().emailIsValid(_emailCtrl.text) &&
                    Validations().passwordIsValid(_passwordCtrl.text)) {
                  ctrlAccount.signIn(_emailCtrl.text, _passwordCtrl.text);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String errorConcat =
                          Errors.invalidEmail + '\n' + Errors.invalidPassword;
                      return AlertDialogError(
                        'Email ou Password invalid',
                        errorConcat,
                      );
                    },
                  );
                }
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogError(
                      'Empty Fields',
                      Errors.emptyEmailAndPassword,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
