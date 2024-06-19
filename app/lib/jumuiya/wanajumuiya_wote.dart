import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/matangazo/matangazo_controller.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Mwanajumuiya_wote extends StatefulWidget {
  @override
  State<Mwanajumuiya_wote> createState() => _Mwanajumuiya_wote();
}

class _Mwanajumuiya_wote extends State<Mwanajumuiya_wote> {
  final formkey = GlobalKey<FormState>();

  MatangazoController JumuiyaController = Get.put(MatangazoController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("Mwanajumuiya_wote"),
        ),
      ),
    );
  }
}
