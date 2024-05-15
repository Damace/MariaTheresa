import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tv extends StatefulWidget {
  @override
  State<Tv> createState() => _Tv();
}

class _Tv extends State<Tv> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Tv"),
        ),
      ),
    );
  }
}
