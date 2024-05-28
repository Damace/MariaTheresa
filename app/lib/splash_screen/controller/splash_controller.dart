// ignore_for_file: unnecessary_import

import 'package:app/routes/app_routes.dart';
import 'package:app/splash_screen/models/splash_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      //Get.offNamed(AppRoutes.phonenumber);
      Get.offNamed(AppRoutes.homescreen);
    });
  }
}
