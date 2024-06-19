// ignore_for_file: unused_import

import 'dart:io';
import 'package:app/APIs/homepage/api_links.dart';
import 'package:app/APIs/homepage/ratibaIbada_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/modals/all_modals.dart';
import 'package:app/notification/notification.dart';
import 'package:app/widgets/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class HomeController extends GetxController {
  var ratibaList = <Ratiba>[].obs;
  var fomuList = <Fomu>[].obs;
  var matangazoList = <Matangazo>[].obs;
  var parokiaMatukioList = <ParokiaMatukio>[].obs;
  var isLoading = true.obs;
  var isConnected = false.obs;

  @override
  void onInit() {
    GetRatiba();
    super.onInit();

    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  void fetchFoms() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://app.parokiayakiwanjachandege.or.tz/fomu'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        fomuList.value =
            jsonResponse.map((album) => Fomu.fromJson(album)).toList();
      } else {
        Fluttertoast.showToast(
            msg: " Hakuna mtandao",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 14.0.fSize);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchMatango() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('https://app.parokiayakiwanjachandege.or.tz/fomu'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        matangazoList.value =
            jsonResponse.map((album) => Matangazo.fromJson(album)).toList();
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

  void fetchMatukio() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://app.parokiayakiwanjachandege.or.tz/parokia_matukio'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        print(jsonResponse);
        parokiaMatukioList.value = jsonResponse
            .map((album) => ParokiaMatukio.fromJson(album))
            .toList();
      } else {
        Fluttertoast.showToast(
            msg: " Hakuna Tukio",
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

//************************************* */

  double? progress;
  late String localPath;
  late bool permissionReady;
  late TargetPlatform? platform;
}
