// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/otp_screen/otp_successifuly_verified.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/usajiri/Untitled-1.dart';
import 'package:app/usajiri/usajiri.dart';
import 'package:app/usajiri/usajiri_wageni.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class Usajiri_jumuiya extends StatefulWidget {
  @override
  _Usajiri_jumuiya createState() => _Usajiri_jumuiya();
}

class _Usajiri_jumuiya extends State<Usajiri_jumuiya> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  // This is the value of the currently selected radio button.
  int _selectedValue = 0;

  // This function will be called when a radio button is selected.
  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (kDebugMode) {
            // print("$didPop");
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: appTheme.defaultcolor,
              foregroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Text(
                "Kamilisha Usajili",
                style: TextStyle(
                  fontSize: 16.fSize,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.v,
                    ),
                    SlideInLeft(
                      child: Container(
                        width: 180.h,
                        height: 180.v,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.v,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12, left: 10),
                      child: Row(
                        children: [
                          Text(" Unajumuiya ?",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 18.fSize,
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.defaultcolor)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: _selectedValue,
                          onChanged: _handleRadioValueChange,
                          activeColor: appTheme.defaultcolor,
                          // Custom color for selected radio button
                        ),
                        Text("Ndiyo",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.bold,
                                color: appTheme.defaultcolor)),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: _selectedValue,
                          onChanged: _handleRadioValueChange,
                          activeColor: appTheme.defaultcolor,
                        ),
                        Text("Hapana ( Wageni)",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: 14.fSize,
                                fontWeight: FontWeight.bold,
                                color: appTheme.defaultcolor)),
                      ],
                    ),
                    SizedBox(
                      height: 15.v,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.v, left: 30.h, right: 30.h),
                      child: Container(
                        height: 60.v,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_selectedValue == 0) {
                              Get.to(Usajiri(),
                                  duration: Duration(milliseconds: 500),
                                  transition:
                                      Transition.fadeIn //transition effect
                                  );
                            } else {
                              Get.to(Usajiriwagani(),
                                  duration: Duration(milliseconds: 500),
                                  transition:
                                      Transition.fadeIn //transition effect
                                  );
                            }
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
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
                          child: const Text("Endelea"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  // onTapSubmit() {
  //   Get.toNamed(
  //     AppRoutes.locationEmptyScreen,
  //   );
  // }
}
