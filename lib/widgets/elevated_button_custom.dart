import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final String titleButton;
  final Function onPressedFunction;
  ElevatedButtonCustom(
    this.titleButton,
    this.onPressedFunction,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(titleButton),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(13.0)),
              ),
              onPressed: onPressedFunction,
            ),
          ),
        ),
      ],
    );
  }
}
