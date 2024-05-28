// ignore_for_file: prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/otp_screen/OTP.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class PhoneNumber extends StatefulWidget {
  @override
  State<PhoneNumber> createState() => _PhoneNumber();
}

class _PhoneNumber extends State<PhoneNumber> {
  final formkey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 50.v, right: 15.h, left: 15.h),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200.h,
                  height: 200.v,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/illustration-2.png',
                  ),
                ),
                SizedBox(
                  height: 24.v,
                ),
                Text(
                  "Phone number Verification",
                  style: TextStyle(
                    fontSize: 24.fSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "We send you an One Time Password (OPT)\n on this phone number",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30.v),
                Text(
                  "Enter Phone number",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.v),
                TextFormField(
                  showCursor: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: appTheme.defaultcolor,
                        )),
                    hintText: '+255762700405',
                    //  labelText: 'first named',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    errorStyle: TextStyle(fontSize: 18.0),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: appTheme.defaultcolor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(Otp(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            appTheme.defaultcolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Get OTP',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
