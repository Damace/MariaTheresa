// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new, sort_child_properties_last, unused_field

import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/jumuiya/jumuiya_login_controller.dart';
import 'package:app/jumuiya/jumuiya_login_modal.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:searchfield/searchfield.dart';
import 'package:http/http.dart' as http;

class Jumuiya_ extends StatefulWidget {
  @override
  State<Jumuiya_> createState() => _Jumuiya();
}

class _Jumuiya extends State<Jumuiya_> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Jumuiya_login_Controller jumuiya_login = Jumuiya_login_Controller();

  String dropdownValue = 'Option 1';
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();

    fetchdata();
  }

  fetchdata() async {
    final response = await http.get(
        Uri.parse('https://app.parokiayakiwanjachandege.or.tz/jumuiya_all'));

    jumuiya_login.data = jsonDecode(response.body);

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 5.v, right: 15.h, left: 15.h),
          child: FormBuilder(
            key: jumuiya_login.formkey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: Text(
                        "",
                        style: TextStyle(
                            fontSize: 14.fSize,
                            color: appTheme.defaultcolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.h,
                        ),
                        Icon(
                          Icons.people,
                          size: 25.fSize,
                          color: appTheme.defaultcolor,
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                        Expanded(
                          child: DropdownButton(
                            underline: Container(color: Colors.transparent),
                            hint: Text(
                              "Chagua jumuiya",
                              style: TextStyle(
                                  fontSize: 12.fSize,
                                  fontWeight: FontWeight.bold,
                                  color: appTheme.defaultcolor),
                            ),
                            items: jumuiya_login.data.map((e) {
                              return DropdownMenuItem(
                                  child: Text(
                                    e["jina"],
                                    style: TextStyle(
                                        fontSize: 12.fSize,
                                        fontWeight: FontWeight.bold,
                                        color: appTheme.defaultcolor),
                                  ),
                                  value: e["jina"]);
                            }).toList(),
                            value: jumuiya_login.value,
                            onChanged: (v) {
                              jumuiya_login.value = v as String;
                              setState(() {
                                // print(jumuiya_login.value);
                                jumuiya_login.value = v;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)),
                    child: FormBuilderTextField(
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      obscureText: obscurePassword,
                      controller: jumuiya_login.jumuiya_password,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: appTheme.defaultcolor,
                      name: 'password',
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        prefixIcon: InkWell(
                          onTap: () {
                            obscurePassword = !obscurePassword;
                            setState(() {});
                          },
                          child: Icon(
                            obscurePassword ? Icons.lock : Icons.lock_open,
                            size: 25.fSize,
                            color: appTheme.defaultcolor,
                          ),
                        ),
                        labelText: "Namba ya Siri",
                        labelStyle: TextStyle(
                            fontSize: 12.fSize,
                            fontWeight: FontWeight.bold,
                            color: appTheme.defaultcolor),
                      ),
                    ),
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
                          jumuiya_login.submit();
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
      ),
    ));
  }
}
