import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Michango extends StatefulWidget {
  @override
  State<Michango> createState() => _Michango();
}

class _Michango extends State<Michango> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Michango"),
        ),
      ),
    );
  }
}
