import 'package:flutter/material.dart';

class AlertDialogError extends StatelessWidget {
  final String titleAlert;
  final String error;

  AlertDialogError(
    this.titleAlert,
    this.error,
  );
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titleAlert),
      content: Text(error),
      actions: [
        FlatButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
