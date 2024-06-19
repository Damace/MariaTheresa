// ignore_for_file: unnecessary_import
import 'dart:async';

import 'package:app/jumuiya/jumuiya_login.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/splash_screen/models/splash_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  bool hasConnection = false;

  ConnectivityResult? connectionMedium;
  StreamController<bool> connectionChangeController =
      StreamController.broadcast();
  Stream<bool> get connectionChange => connectionChangeController.stream;

  @override
  void onInit() {
    super.onInit();
    loging();
  }

  Future<void> loging() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var registered = pref.getString("registered");

    if (registered == "true") {
      Future.delayed(const Duration(milliseconds: 4000), () {
        //Get.offNamed(AppRoutes.homescreen);

         Get.to(Jumuiya_(),
                                  duration: Duration(milliseconds: 500),
                                  transition:
                                      Transition.fadeIn //transition effect
                                  );


      });
    } else {
      Future.delayed(const Duration(milliseconds: 4000), () {
       // Get.offNamed(AppRoutes.homescreen);

           Get.to(Jumuiya_(),
                                  duration: Duration(milliseconds: 500),
                                  transition:
                                      Transition.fadeIn //transition effect
                                  );




      });
    }
  }

  // Future<void> loging() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var registered = pref.getString("registered");

  //   if (registered == "true") {
  //     Future.delayed(const Duration(milliseconds: 4000), () {
  //       Get.offNamed(AppRoutes.homescreen);
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 4000), () {
  //       Get.offNamed(AppRoutes.otp_screen);
  //     });
  //   }
  // }
}
