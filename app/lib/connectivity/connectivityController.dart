// ignore_for_file: unused_import

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ConnectivityController extends GetxController {
  var connectionType = "".obs;

  final Connectivity connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    getConnectionStatus();
  }

  Future<void> getConnectionStatus() async {
    var connectivityResults;

    try {
      connectivityResults = await connectivity.checkConnectivity();
      getConnectionType(connectivityResults);
    } catch (e) {
      Get.snackbar("error", "error durinng checking");
    }
  }

  void getConnectionType(connectivityResults) {
    if (connectivityResults == ConnectivityResult.wifi) {
    } else if (connectivityResults == ConnectivityResult.mobile) {
    } else {}
  }
}
