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

class JumuiyaController extends GetxController {
  var isLoading = false.obs;
  var mahudhurioList = <Mahudhurio>[].obs;

    var wanaparokiaList = <Wanaparokia>[].obs;






  static var client = http.Client();

String shared_jumuiya = '';





  @override
  void onInit() {
   // fetchMahudhurio();
    //fetchratiba();
    super.onInit();
  }

// *************************************************** API REQUESTING *********************************************************

  // void fetchratiba() async {
  //   try {
  //     isLoading(true);
  //     var mahudhurio = await fetchMahudhurio();
  //     if (mahudhurio != null) {
  //       mahudhurioList.value = mahudhurio;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // Future<List<Mahudhurio>?> fetchMahudhurio() async {
  //   try {
  //     var response =
  //         await client.get(Uri.parse('http://192.168.0.3:8000/get_attendance'));

  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       print(jsonString);
  //       return mahudhurioFromJson(jsonString);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  
  void fetchMatango() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://app.parokiayakiwanjachandege.or.tz/wanaparokia_get/${shared_jumuiya}'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        wanaparokiaList.value =
            jsonResponse.map((album) => Wanaparokia.fromJson(album)).toList();
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
