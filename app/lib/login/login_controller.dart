// ignore_for_file: unused_field, prefer_const_constructors, avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:app/core/utils/size_utils.dart';
import 'package:app/modals/all_modals.dart';
import 'package:app/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController with CodeAutoFill {
  TextEditingController phone_num = TextEditingController();
  TextEditingController password = TextEditingController();

  void submit() async {
    String url = "https://app.parokiayakiwanjachandege.or.tz/userlogin";

    var response = await http.post(Uri.parse(url),
        body: {"namba": "${phone_num.text}", "password": "${password.text}"});

    var rensponse = jsonDecode(response.body);

    if (rensponse["status"] == true) {
      phone_num.clear();
      password.clear();
      Get.toNamed(AppRoutes.homescreen);
    } else {
      phone_num.clear();
      password.clear();
      Fluttertoast.showToast(
          msg: "Wrong phone number or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 12.0);
    }
  }

  @override
  void codeUpdated() {}

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
