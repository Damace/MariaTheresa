// ignore_for_file: duplicate_import, unused_import

import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/modals/all_modals.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var mapadriList = <Mapadri>[].obs;

  static var client = http.Client();

  void fetchMapadre() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://app.parokiayakiwanjachandege.or.tz/mapadre'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        mapadriList.value =
            jsonResponse.map((album) => Mapadri.fromJson(album)).toList();
      } else {
        Fluttertoast.showToast(
            msg: " Hakuna mtandao",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 14.0.fSize);
      }
    } finally {
      isLoading(false);
    }
  }

  List<String> items = [];

  DateTime getDate = DateTime.now();

  void insertData() async {
    items.forEach((element) async {
      try {
        String uri = "http://192.168.0.3:8000/mahudhurio";
        var res = await http.post(Uri.parse(uri), body: {
          "tarehe": '${getDate.day}${getDate.month}${getDate.year}',
          "jumuiya": "Seller",
          "mwanajumuiya": '${element}',
          "mahudhurio": "true"
        });
      } catch (e) {
        print(e);
      }
    });
    Get.snackbar(
      "Successfully",
      "Account has been Updated Successfully",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Color.fromARGB(255, 35, 135, 40),
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      shouldIconPulse: true,
      barBlur: 20,
    );

    // items.clear();

    Get.offNamed(AppRoutes.jumuiya_home);
  }
}
