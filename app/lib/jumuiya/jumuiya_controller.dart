import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:http/http.dart' as http;

class JumuiyaController extends GetxController {
  var isLoading = false.obs;
  var mahudhurioList = <Mahudhurio>[].obs;

  static var client = http.Client();

  @override
  void onInit() {
    fetchMahudhurio();
    fetchratiba();
    super.onInit();
  }

// *************************************************** API REQUESTING *********************************************************

  void fetchratiba() async {
    try {
      isLoading(true);
      var mahudhurio = await fetchMahudhurio();
      if (mahudhurio != null) {
        mahudhurioList.value = mahudhurio;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<Mahudhurio>?> fetchMahudhurio() async {
    try {
      var response =
          await client.get(Uri.parse('http://192.168.0.3:8000/get_attendance'));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return mahudhurioFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  // ***************************************************END OF  API REQUESTING *********************************************************

// ********************************************************  DATA SUBMIT ***************************************************************

  // var items = <String>[].obs;

  List<String> items = [];

  void insertData() async {
    items.forEach((element) async {
      try {
        String uri = "http://192.168.0.3:8000/mahudhurio";
        var res = await http.post(Uri.parse(uri), body: {
          "tarehe": "Seller",
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