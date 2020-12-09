import 'package:flutter/material.dart';

class TextPassword extends StatefulWidget {
  final TextEditingController ctrl;
  final String labelText;
  final String Function(String) validation;

  TextPassword(
    this.ctrl,
    this.labelText,
    this.validation,
  );
  @override
  _TextPasswordState createState() => _TextPasswordState();
}

class _TextPasswordState extends State<TextPassword> {
  bool visibility = false;
  bool obscureText = true;
  IconData iconData;

  IconData getIcon(bool obscureText) {
    if (obscureText) {
      iconData = Icons.visibility_off_outlined;
    } else {
      iconData = Icons.visibility_outlined;
    }
    return iconData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: widget.ctrl,
        validator: widget.validation,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: Icon(getIcon(obscureText)),
            onPressed: () {
              setState(() {
                visibility = !visibility;
                obscureText = !obscureText;
                getIcon(obscureText);
              });
            },
          ),
        ),
      ),
    );
  }
}
