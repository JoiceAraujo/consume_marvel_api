import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController ctrlText;
  final TextCapitalization capitalizationText;
  final String labelText;

  TextFieldCustom(
    this.ctrlText,
    this.capitalizationText,
    this.labelText,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: TextFormField(
        controller: ctrlText,
        textCapitalization: capitalizationText,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }
}
