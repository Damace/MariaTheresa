import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class KamilishaUsajiri extends StatefulWidget {
  @override
  State<KamilishaUsajiri> createState() => _KamilishaUsajiri();
}

class _KamilishaUsajiri extends State<KamilishaUsajiri> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tafadhali Kamilisha Usajiri wa Taarifa zako",
              style: TextStyle(fontSize: 12.fSize),
            ),
          ],
        ),
      ),
    );
  }
}
