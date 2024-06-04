// ignore_for_file: prefer_const_constructors, unused_import

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_login_controller.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

class Jumuiya extends StatefulWidget {
  @override
  State<Jumuiya> createState() => _Jumuiya();
}

class _Jumuiya extends State<Jumuiya> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Jumuiya_login_Controller jumuiya_login = Jumuiya_login_Controller();

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
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 30.v, right: 15.h, left: 15.h),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SlideInRight(
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
              SizedBox(height: 10.v),
              Text(
                "",
                style: TextStyle(
                  fontSize: 12.fSize,
                ),
              ),
              SizedBox(height: 20.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.h),
                    child: Text(
                      "Kwa matumizi ya Jumuiya tu.",
                      style: TextStyle(
                          fontSize: 14.fSize,
                          color: appTheme.defaultcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.v,
              ),
              FormBuilder(
                key: _fbKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            controller: jumuiya_login.jumuiya,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'jumuiya',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Jumuiya",
                              hintText: "Albert hutado",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            controller: jumuiya_login.jumuiya_password,
                            obscureText: true,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'password',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.v),
                    child: ElevatedButton(
                      onPressed: () {
                        jumuiya_login.register();
                        if (_fbKey.currentState!.validate()) {
                          jumuiya_login.register();
                        }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            appTheme.defaultcolor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(fontSize: 16.fSize),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
