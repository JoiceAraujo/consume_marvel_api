import 'package:flutter/material.dart';

class AlertDialogError extends StatefulWidget {
  final String titleAlert;
  final String error;

  AlertDialogError(
    this.titleAlert,
    this.error,
  );

  @override
  _AlertDialogErrorState createState() => _AlertDialogErrorState();
}

class _AlertDialogErrorState extends State<AlertDialogError> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.titleAlert),
      content: Text(widget.error),
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
