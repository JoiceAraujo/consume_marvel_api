import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String route = '/profile_screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Have Faith'),
      ),
    );
  }
}
