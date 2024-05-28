// ignore_for_file: prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Jumuiya_password extends StatefulWidget {
  @override
  State<Jumuiya_password> createState() => _Jumuiya_password();
}

class _Jumuiya_password extends State<Jumuiya_password> {
  final formkey = GlobalKey<FormState>();

  TextEditingController Jumuiya_passwordController = TextEditingController();
  late String dropdown;

  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  get dropdownValue => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appTheme.defaultcolor,
          foregroundColor: Colors.white,
          title: Text(
            "Kamilisha Usajiri",
            style: TextStyle(
              fontSize: 16.fSize,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 50.v, right: 15.h, left: 15.h),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.h,
                  height: 150.v,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/illustration-2.png',
                  ),
                ),
                SizedBox(height: 10.v),
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 30.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 14.fSize, color: appTheme.defaultcolor),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.v),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.3)),
                      // color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8)),
                  child: FormBuilderTextField(
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: appTheme.defaultcolor,
                    autofocus: true,
                    name: 'password',
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 23.fSize,
                        color: appTheme.defaultcolor,
                      ),
                      labelText: "",
                      labelStyle: TextStyle(
                          color: appTheme.defaultcolor, fontSize: 12.fSize),
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
                        Get.to(Jumuiya_home(),
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
                          'Log in',
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
