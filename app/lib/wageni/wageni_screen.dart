import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wageni extends StatefulWidget {
  @override
  State<Wageni> createState() => _Wageni();
}

class _Wageni extends State<Wageni> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Wageni"),
        ),
      ),
    );
  }
}
