// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:ui';

import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/jumuiya/jumuiya_login_modal.dart';
import 'package:app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class Jumuiya_login_Controller extends GetxController {
  var isLoading = false.obs;
  var mahudhurioList = <Mahudhurio>[].obs;

  var albums = <Album>[].obs;
  var items = <Items>[].obs;

  TextEditingController jumuiya = TextEditingController();
  TextEditingController jumuiya_password = TextEditingController();

  List data = [];

  List<Items> dat = [];

  @override
  void onInit() {
    super.onInit();
    //fetchAlbums();
    fetchItems();
  }

  

  void fetchAlbums() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        albums.value = jsonResponse.map((album) => Album.fromJson(album)).toList();
      } else {
        Get.snackbar('Error', 'Failed to load albums');
      }
    } finally {
      isLoading(false);
    }
  }




  void fetchItems() async {
    try {
      String jsonData = await rootBundle.loadString('assets/items.json');
      var jsonResponse = json.decode(jsonData) as List;
      //data = jsonResponse;
      print(jsonResponse);
      items.value = jsonResponse.map((items) => Items.fromJson(items)).toList();
      data = jsonResponse.map((items) => Items.fromJson(items)).toList();
    } catch (e) {
      print(e);
    }
  }

  //   static Future<List<Items>?> fetchItems() async {
  //   try {
  //     String jsonData = await rootBundle.loadString('assets/items.json');
  //     // return json.decode(jsonData);
  //     var jsonString = json.decode(jsonData);
  //     return itemsFromJson(jsonString);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void register() async {
  //   Get.toNamed(AppRoutes.jumuiya_home);

  //   String _jumuiya = jumuiya.text;
  //   String _jumuiya_password = jumuiya_password.text;

  //   String url = "http://192.168.0.3:8000/jumuiya_login";

  //   var response = await http.post(Uri.parse(url), body: {
  //     "jumuiya": "$_jumuiya",
  //     "jumuiya_password": "$_jumuiya_password",
  //   });

  //   var rensponse = jsonDecode(response.body);

  //   if (rensponse["status"] == true) {
  //     Get.snackbar(
  //       "Welcome",
  //       "",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Color.fromARGB(255, 35, 135, 40),
  //       colorText: Colors.white,
  //       icon: const Icon(Icons.church, color: Colors.white),
  //       shouldIconPulse: true,
  //       barBlur: 20,
  //     );

  //     jumuiya.clear();
  //     jumuiya_password.clear();
  //     Get.toNamed(AppRoutes.jumuiya_home);
  //   } else {
  //     Get.snackbar(
  //       "Wrong Password or Username",
  //       "Try again",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //       icon: const Icon(Icons.church, color: Colors.white),
  //       shouldIconPulse: true,
  //       barBlur: 20,
  //     );

  //     jumuiya.clear();
  //     jumuiya_password.clear();
  //   }
  // }
}