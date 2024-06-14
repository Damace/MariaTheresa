import 'package:app/core/utils/size_utils.dart';
import 'package:app/otp_screen/auth_service.dart';
import 'package:app/otp_screen/form_otp_controller.dart';
import 'package:app/otp_screen/otp_successifuly_verified.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class FormOtpScreen extends GetWidget<FormOtpController> {
  late Color myColor;
  late Size mediaSize;

  final formkey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();

  FormOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 25.v, left: 10.h, right: 10.h),
          child: Container(
              width: double.maxFinite,
              //padding: getPadding(left: 24, top: 22, right: 24, bottom: 22),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/otp.png',
                      ),
                    ),
                    Container(
                        child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Verification Code",
                              style: TextStyle(
                                  fontSize: 20.fSize,
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.defaultcolor))
                        ],
                      ),
                      SizedBox(
                        height: 15.v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Please enter the OTP sent\n on your registered phone number.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14.fSize,
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.defaultcolor))
                        ],
                      )
                    ])),
                    SizedBox(
                      height: 15.v,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: formkey,
                        child: PinCodeTextField(
                            appContext: context,
                            controller: otpController,
                            length: 6,
                            obscureText: false,
                            obscuringCharacter: '*',
                            keyboardType: TextInputType.number,
                            autoDismissKeyboard: true,
                            enableActiveFill: true,
                            validator: (value) {
                              if (otpController == null) {
                                return 'This field is required';
                              }
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (value) {},
                            pinTheme: PinTheme(
                                fieldHeight: 50.v,
                                fieldWidth: 50.h,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(8),
                                selectedFillColor:
                                    Colors.white.withOpacity(0.2),
                                activeFillColor: Colors.white,
                                inactiveFillColor:
                                    appTheme.defaultcolor.withOpacity(0.3),
                                inactiveColor:
                                    appTheme.defaultcolor.withOpacity(0.3),
                                selectedColor: appTheme.defaultcolor,
                                activeColor: appTheme.defaultcolor)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 70.v, left: 10.h, right: 10.h),
                      child: Container(
                        height: 60.v,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(OtpSuccess(),
                                duration: Duration(milliseconds: 500),
                                transition:
                                    Transition.fadeIn //transition effect
                                );

                            // if (formkey.currentState!.validate()) {
                            //   AuthService.loginWithOtp(otp: otpController.text)
                            //       .then((value) async {
                            //     if (value == "Success") {
                            //       Get.toNamed(

                            //         AppRoutes.homescreen,

                            //       );
                            //       final SharedPreferences pref =
                            //           await SharedPreferences.getInstance();
                            //       pref.setString("phoneVerified", "true");

                            //     } else {
                            //       Get.snackbar(
                            //         "Error",
                            //         "Invalid OTP Codes",
                            //         snackPosition: SnackPosition.TOP,
                            //         backgroundColor: Colors.red,
                            //         colorText: Colors.white,
                            //         icon: const Icon(Icons.error,
                            //             color: Colors.white),
                            //         shouldIconPulse: true,
                            //         barBlur: 20,
                            //       );
                            //     }
                            //   });
                            // }
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(32),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  appTheme.defaultcolor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )),
                          child: const Text("Verify"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 60.v, left: 10.h, right: 10.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Text("D",
                            //     textAlign: TextAlign.right,
                            //     style: TextStyle(
                            //         fontSize: 12.fSize,
                            //         fontWeight: FontWeight.bold,
                            //         color: appTheme.defaultcolor)),
                            Text("Resend OTP Code",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.bold,
                                    color: appTheme.defaultcolor)),
                          ]),
                    )
                  ])),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 7, 105, 64),
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text("Verify OTP"),
    );
  }

  onTapBtnArrowleft() {
    Get.back();
  }

  // onTapSubmit() {
  //   Get.toNamed(
  //     AppRoutes.locationEmptyScreen,
  //   );
  // }
}
