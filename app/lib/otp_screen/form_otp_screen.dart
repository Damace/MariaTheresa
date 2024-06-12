import 'package:app/core/utils/size_utils.dart';
import 'package:app/otp_screen/auth_service.dart';
import 'package:app/otp_screen/form_otp_controller.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
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
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appTheme.defaultcolor,
      body: Container(
          width: double.maxFinite,
          //padding: getPadding(left: 24, top: 22, right: 24, bottom: 22),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // CustomIconButton(
                //     height: 50,
                //     width: 50,
                //     margin: getMargin(top: 1),
                //     variant: IconButtonVariant.FillGray100,
                //    // shape: IconButtonShape.CircleBorder25,
                //     padding: IconButtonPadding.PaddingAll16,
                //     onTap: () {
                //       onTapBtnArrowleft();
                //     },
                //    // child:CustomImageView(svgPath: ImageConstant.imgArrowleft)

                //         ),
                Container(
                    width: 248.h,
                    // margin: getMargin(top: 54, right: 79),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "lbl_enter_the",
                              style: TextStyle(
                                color: Color.fromARGB(255, 7, 105, 64),
                                fontSize: 25.fSize,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w500,
                                //letterSpacing: getHorizontalSize(0.75)
                              )),
                          TextSpan(
                              text: "msg_verification_code",
                              style: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 18.fSize,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.75.h))
                        ]),
                        textAlign: TextAlign.left)),
                Container(
                    width: 248.h,
                    // margin: (top: 25., right: 78),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "msg_enter_thpe_4_digit2",
                              style: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.75.h)),
                          TextSpan(
                              text: "lbl_user",
                              style: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.75.h)),
                          TextSpan(
                              text: "lbl37",
                              style: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.75.h)),
                          TextSpan(
                              text: "lbl_email_com",
                              style: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.75.h))
                        ]),
                        textAlign: TextAlign.left)),
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
                            fieldHeight: 40.v,
                            fieldWidth: 40.h,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(25.h),
                            selectedFillColor: appTheme.defaultcolor,
                            activeFillColor: appTheme.defaultcolor,
                            inactiveFillColor: appTheme.defaultcolor,
                            inactiveColor: appTheme.defaultcolor,
                            selectedColor: appTheme.defaultcolor,
                            activeColor: appTheme.defaultcolor)),
                  ),
                ),
                Spacer(),
                // CustomButton(
                //     height: getVerticalSize(50),
                //     width: getHorizontalSize(90),
                //     text: "lbl_00_21",
                //     variant: ButtonVariant.FillGray100,
                //     shape: ButtonShape.CircleBorder25,
                //     padding: ButtonPadding.PaddingT17,
                //     fontStyle: ButtonFontStyle.MontserratMedium12Bluegray80001,
                //     prefixWidget: Container(
                //         margin: getMargin(right: 8),
                //         child:
                //             CustomImageView(svgPath: ImageConstant.imgClock)),
                //     alignment: Alignment.center),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(top: 15.v),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "msg_didn_t_receive_the",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.v),
                                  child: TextButton(
                                    child: Text(
                                      "lbl_resend_otp",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                    onPressed: () {},
                                  ))
                            ])))
              ])),
      bottomNavigationBar: Container(
        height: 60.v,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              AuthService.loginWithOtp(otp: otpController.text)
                  .then((value) async {
                if (value == "Success") {
                  Get.toNamed(
                    AppRoutes.homescreen,
                  );
                  final SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString("phoneVerified", "true");

                  Get.snackbar(
                    "Successfully",
                    "Your phone number has Verified",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    icon: const Icon(Icons.error, color: Colors.white),
                    shouldIconPulse: true,
                    barBlur: 20,
                  );
                } else {
                  Get.snackbar(
                    "Error",
                    "Invalid OTP Codes",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    icon: const Icon(Icons.error, color: Colors.white),
                    shouldIconPulse: true,
                    barBlur: 20,
                  );
                }
              });
            }
          },
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(32),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(appTheme.defaultcolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
          child: const Text("Get OTP"),
        ),
      ),
    ));
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
