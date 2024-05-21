import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ujenzi extends StatefulWidget {
  @override
  State<Ujenzi> createState() => _Ujenzi();
}

class _Ujenzi extends State<Ujenzi> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        title: Text(
          "Ujenzi",
          style: TextStyle(
            fontSize: 16.fSize,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Ujenzi"),
        ),
      ),
    );
  }
}
