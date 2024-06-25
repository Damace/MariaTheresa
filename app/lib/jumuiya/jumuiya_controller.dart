// ignore_for_file: duplicate_import, unused_import, unused_local_variable

import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/modals/all_modals.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JumuiyaController extends GetxController {
  var isLoading = false.obs;
  var mahudhurioList = <Mahudhurio>[].obs;

  var wanaparokiaList = <Wanaparokia>[].obs;

  static var client = http.Client();

  String shared_jumuiya = '';

  @override
  void onInit() {
    super.onInit();
  }

  void fetchWanaparokia() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://app.parokiayakiwanjachandege.or.tz/wanaparokia_get/${shared_jumuiya}'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        wanaparokiaList.value =
            jsonResponse.map((album) => Wanaparokia.fromJson(album)).toList();
      } else {}
    } finally {
      isLoading(false);
    }
  }

  List<String> items = [];

  DateTime getDate = DateTime.now();

  void insertData() async {
    if (items.isEmpty) {
      Fluttertoast.showToast(
          msg: "Hakuna aliyechaguliwa",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 12.0);
    } else {
      items.forEach((element) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var jumuiya_a = prefs.getString("jumuiya_") ?? '';

        try {
          String uri = "https://app.parokiayakiwanjachandege.or.tz/mahudhurio";
          var res = await http.post(Uri.parse(uri), body: {
            "tarehe": '${getDate.day}/${getDate.month}/${getDate.year}',
            "jumuiya": '${jumuiya_a}',
            "mwanajumuiya": '${element}',
            "mahudhurio": "true"
          });
        } catch (e) {
          print(e);
        }
        Get.offNamed(AppRoutes.jumuiya_home);
        Get.snackbar(
          "Success",
          "Submitted Successfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: appTheme.defaultcolor.withOpacity(0.5),
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: true,
          barBlur: 20,
        );
      });
    }
  }
}
