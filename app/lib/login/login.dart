// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:app/connectivity/connectivityController.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/login/login_controller.dart';
import 'package:app/otp_screen/auth_service.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_ extends StatefulWidget {
  @override
  State<Login_> createState() => _Login_();
}

class _Login_ extends State<Login_> {
  LoginController login = Get.put(LoginController());

  bool obscurePassword = true;
  var connectionType = "".obs;
  final formkey = GlobalKey<FormState>();
  late Color myColor;
  late Size mediaSize;
  bool rememberUser = false;
  bool otpButton = true;
  bool otpButton0 = false;
  var presscount = 0;

  @override
  void initState() {
    super.initState();
    checkforConnectivity();
  }

  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myColor = appTheme.defaultcolor;
    mediaSize = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (kDebugMode) {
          // print("$didPop");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: myColor,
          // image: DecorationImage(
          //   image: const AssetImage("assets/images/bg.png"),
          //   fit: BoxFit.cover,
          //   colorFilter:
          //       ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
          // ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Positioned(
                top: 100.v,
                child: SizedBox(
                  width: mediaSize.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 180.h,
                        height: 180.v,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: MediaQuery.of(context).size.width * 0.0,
                child: SizedBox(
                  height: 480.v,
                  width: mediaSize.width,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Log in",
                            style: TextStyle(
                                color: myColor,
                                fontSize: 20.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10.v),

                          SizedBox(height: 5.v),
                          Form(
                            key: formkey,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.15),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: appTheme.defaultcolor)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.h, right: 8.h),
                                    child: TextFormField(
                                        controller: login.phone_num,
                                        keyboardType: TextInputType.phone,
                                        cursorColor: appTheme.defaultcolor,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          prefixIcon:
                                              Icon(Icons.phone_android_rounded),
                                          labelText: "Phone number",
                                          labelStyle: TextStyle(
                                              color: appTheme.defaultcolor,
                                              fontSize: 12.fSize),
                                        ),
                                        validator: (phoneNumber) =>
                                            validatePhonenumber(phoneNumber)),
                                  ),
                                ),
                                SizedBox(height: 20.v),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.15),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: appTheme.defaultcolor)),
                                  child: FormBuilderTextField(
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                    ]),
                                    obscureText: obscurePassword,
                                    controller: login.password,
                                    keyboardType: TextInputType.visiblePassword,
                                    cursorColor: appTheme.defaultcolor,
                                    name: '',
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          obscurePassword = !obscurePassword;
                                          setState(() {});
                                        },
                                        child: Icon(
                                          obscurePassword
                                              ? Icons.lock
                                              : Icons.lock_open,
                                          size: 23.fSize,
                                          color: appTheme.defaultcolor,
                                        ),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                          color: appTheme.defaultcolor,
                                          fontSize: 12.fSize),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 60.v,
                                  width: double.infinity,
                                  child: Visibility(
                                    visible: otpButton,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          login.submit();
                                        }
                                      },
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(32),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  appTheme.defaultcolor),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          )),
                                      child: const Text("Login"),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 60.v,
                                  width: double.infinity,
                                  child: Visibility(
                                    visible: otpButton0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.snackbar("",
                                            "Check fon Connection then try again",
                                            titleText: Text(
                                              "No internet Connection",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.fSize,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            messageText: Text(
                                              "Check for Internet Connection then try again.",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.fSize),
                                            ),
                                            duration: 60.minutes,
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.25),
                                            colorText: Colors.white,
                                            icon: Icon(
                                              Icons.network_check_outlined,
                                              color: Colors.white,
                                            ),
                                            shouldIconPulse: true,
                                            barBlur: 120,
                                            mainButton: TextButton(
                                                onPressed: Get.back,
                                                child: const Text("Close")));
                                      },
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all(32),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  appTheme.defaultcolor),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          )),
                                      child: const Text("Login"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //  ____________________________________________________________________________________________________________

                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015),
                        ],
                      ),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  validatePhonenumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      return 'This field is required';
    }
    if (phoneNumber.trim().length == 9) {
      return 'Phone number must be 10 characters in length';
    }

    return null;
  }

  otpset(String? phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('phone_number', "${phoneNumber}");
  }
// // *********************************************************************  CHECK

  Future<void> checkforConnectivity() async {
    ConnectivityController connections = ConnectivityController();
    bool value = await connections.hasNetwork();
    // print("The value from FirstClass is: $value");

    if (value == true) {
      setState(() {
        otpButton = true;
      });
      setState(() {
        otpButton0 = false;
      });
    } else {
      setState(() {
        otpButton = false;
      });
      setState(() {
        otpButton0 = true;
      });
      Get.snackbar("", "Check fon Connection then try again",
          titleText: Text(
            "No internet Connection",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.fSize,
                fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            "Check for Internet Connection then try again.",
            style: TextStyle(color: Colors.white, fontSize: 12.fSize),
          ),
          duration: 60.minutes,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white.withOpacity(0.25),
          colorText: Colors.white,
          icon: Icon(
            Icons.network_check_outlined,
            color: Colors.white,
          ),
          shouldIconPulse: true,
          barBlur: 120,
          mainButton:
              TextButton(onPressed: Get.back, child: const Text("Close")));
    }
  }
}
