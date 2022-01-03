import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController ctrl;
  final String Function(String) validation;
  final TextCapitalization capitalization;
  final String labelText;
  final autofocusText;

  TextFormFieldCustom(
    this.ctrl,
    this.validation,
    this.capitalization,
    this.labelText,
    this.autofocusText,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: TextFormField(
        controller: ctrl,
        autofocus: autofocusText,
        validator: validation,
        textCapitalization: capitalization,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
