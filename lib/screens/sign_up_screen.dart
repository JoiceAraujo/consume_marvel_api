import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/account_controller.dart';
import '../models/account.dart';
import '../utils/validations.dart';
import '../widgets/elevated_button_custom.dart';
import '../widgets/text_form_field_custom.dart';
import '../widgets/text_password.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = '/sign_up_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _passwordConfirmationCtrl =
      TextEditingController();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _birthdayCtrl = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AccountController accountController =
        Provider.of<AccountController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Marvel API'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormFieldCustom(
                _nameCtrl,
                (text) {
                  return Validations().nameIsValid(text);
                },
                TextCapitalization.words,
                'Name',
              ),
              TextFormFieldCustom(
                _emailCtrl,
                (text) {
                  return Validations().emailValidation(text);
                },
                TextCapitalization.none,
                'Email',
              ),
              TextFormFieldCustom(
                _birthdayCtrl,
                (text) {
                  return Validations().birthdayIsValid(text);
                },
                TextCapitalization.none,
                'Birthday',
              ),
              TextPassword(
                _passwordCtrl,
                'Password',
                (text) {
                  return Validations().passwordValidation(text);
                },
              ),
              TextPassword(
                _passwordConfirmationCtrl,
                'Password confirmation',
                (text) {
                  return Validations()
                      .passwordConfirmationValidation(text, _passwordCtrl.text);
                },
              ),
              ElevatedButtonCustom(
                'SignUp',
                () {
                  if (_formKey.currentState.validate()) {
                    print('form valid');
                    Account account = Account(
                      _nameCtrl.text.trim(),
                      _emailCtrl.text.trim(),
                      _birthdayCtrl.text.trim(),
                      _passwordCtrl.text.trim(),
                    );

                    accountController.signUp(account);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
