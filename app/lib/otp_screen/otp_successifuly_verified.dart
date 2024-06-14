import 'package:app/core/utils/size_utils.dart';
import 'package:app/otp_screen/form_otp_controller.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/usajiri/usajiri_jumuiya.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

// ignore: must_be_immutable
class OtpSuccess extends GetWidget<FormOtpController> {
  late Color myColor;
  late Size mediaSize;

  final formkey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  OtpSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (kDebugMode) {
            // print("$didPop");
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180.h,
                    height: 180.v,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/success.png',
                    ),
                  ),
                  Text("Successful",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.fSize,
                          fontWeight: FontWeight.bold,
                          color: appTheme.defaultcolor)),
                  Text("Your mobile number has been  \n successfully verified.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w500,
                          color: appTheme.defaultcolor)),
                  SizedBox(
                    height: 15.v,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 70.v, left: 30.h, right: 30.h),
                    child: Container(
                      height: 60.v,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(Usajiri_jumuiya(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.fadeIn //transition effect
                              );
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                appTheme.defaultcolor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )),
                        child: const Text("Karibu"),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  // onTapSubmit() {
  //   Get.toNamed(
  //     AppRoutes.locationEmptyScreen,
  //   );
  // }
}
