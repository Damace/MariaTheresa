// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:app/APIs/homepage/api_links.dart';
import 'package:app/APIs/homepage/ratibaIbada_modal.dart';
import 'package:app/notification/notification.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/widgets/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class MaoniController extends GetxController {
  static var client = http.Client();

  TextEditingController maoniTextfield = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  void submit() async {
    // Get.toNamed(AppRoutes.jumuiya_home);

    var _maoni = maoniTextfield.text;

    String url = "http://192.168.0.3:8000/maoni";

    var response = await http.post(Uri.parse(url), body: {
      "namba_ya_simu": "078887878",
      "majina_kamili": "Alex Mwakalikamo",
      "contents": "$_maoni"
    });

    var rensponse = jsonDecode(response.body);

    if (rensponse["status"] == true) {
      Get.snackbar(
        "Tunashukuru kwa Maoni yako",
        "Tuna yafantia jazi",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appTheme.defaultcolor.withOpacity(0.5),
        colorText: Colors.white,
        icon: const Icon(Icons.church, color: Colors.white),
        shouldIconPulse: true,
        barBlur: 20,
      );

      // jumuiya.clear();
      // jumuiya_password.clear();
      Get.toNamed(AppRoutes.homescreen);
    }
  }
}
