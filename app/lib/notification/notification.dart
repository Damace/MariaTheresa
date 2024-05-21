import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification_screen extends StatefulWidget {
  @override
  State<Notification_screen> createState() => _Notification_screen();
}

class _Notification_screen extends State<Notification_screen> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Notification_screen"),
        ),
      ),
    );
  }
}
