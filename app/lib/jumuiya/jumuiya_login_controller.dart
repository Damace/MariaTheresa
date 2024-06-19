// ignore_for_file: unused_import, unnecessary_string_interpolations

import 'dart:convert';
import 'dart:ui';

import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/jumuiya/jumuiya_login_modal.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Jumuiya_login_Controller extends GetxController {
  final formkey = GlobalKey<FormState>();
  TextEditingController jumuiya_password = TextEditingController();

  List data = [];
  String? value;

  @override
  void onInit() {
    super.onInit();
  }

  submit() async {
    if (jumuiya_password.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Password is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('jumuiya_', "${value}");

      String url = "https://app.parokiayakiwanjachandege.or.tz/applogin";

      var response = await http.post(Uri.parse(url), body: {
        "jumuiya": "${value}",
        "jumuiya_password": "${jumuiya_password.text}"
      });

      var rensponse = jsonDecode(response.body);

      if (rensponse["status"] == true) {
        Get.snackbar(
          "",
          "",
          titleText: Text(
            "Submitted Successfully",
            style: TextStyle(
              fontSize: 14.fSize,
              color: Colors.white,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green[800],
          colorText: Colors.white,
          icon: const Icon(Icons.church, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );

        jumuiya_password.clear();

        Get.to(Jumuiya_home(),
            duration: Duration(milliseconds: 500),
            transition: Transition.fadeIn //transition effect
            );
      } else {
        jumuiya_password.clear();
        Fluttertoast.showToast(
            msg: "Wrong Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
