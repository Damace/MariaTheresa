// ignore_for_file: unused_import

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class ConnectivityController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    hasNetwork();
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await http.get(Uri.parse('http://www.google.com'));
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}

