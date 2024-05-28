// ignore_for_file: prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/jumuiya/jumuiya_password.dart';
import 'package:app/otp_screen/OTP.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';

class Jumuiya extends StatefulWidget {
  @override
  State<Jumuiya> createState() => _Jumuiya();
}

class _Jumuiya extends State<Jumuiya> {
  final formkey = GlobalKey<FormState>();

  TextEditingController JumuiyaController = TextEditingController();
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
                    fontSize: 12.fSize,
                  ),
                ),
                SizedBox(height: 30.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: Text(
                        "Chagua Jumuiya",
                        style: TextStyle(
                            fontSize: 14.fSize, color: appTheme.defaultcolor),
                      ),
                    ),
                  ],
                ),
                GFSearchBar(
                  searchList: list,
                  searchQueryBuilder: (query, list) {
                    return list
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  },
                  overlaySearchListItemBuilder: (item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  onItemSelected: (item) {
                    setState(() {
                      print('$item');
                    });
                  },
                ),
                Spacer(flex: 3),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.v),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(Jumuiya_password(),
                            duration: Duration(milliseconds: 500),
                            transition:
                                Transition.rightToLeft //transition effect
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
                          'Endelea ..',
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
