// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, duplicate_import, unused_local_variable
import 'dart:convert';
import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/jumuiya/jumuiya_login.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/jumuiya/jumuiya_sensa.dart';
import 'package:app/jumuiya/jumuiya_taarifa_za_michango.dart';
import 'package:app/jumuiya/sensa.dart';
import 'package:app/jumuiya/wanajumuiya_wapya.dart';
import 'package:app/jumuiya/wanajumuiya_wote.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/usajiri/mwanajumuiya.dart';
import 'package:app/usajiri/usajiri.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Jumuiya_home extends StatefulWidget {
  @override
  State<Jumuiya_home> createState() => _Jumuiya_home();
}

class _Jumuiya_home extends State<Jumuiya_home> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  JumuiyaController mahudhurioController = Get.put(JumuiyaController());
  JumuiyaController wanajumuiyaController = Get.put(JumuiyaController());

  TextEditingController jumuiya = TextEditingController();

  late Future<List<Mahudhurio>> f;

  @override
  void initState() {
    super.initState();

    _loadJumuiya();
    wanajumuiyaController.fetchWanaparokia();
  }

  // Load username from SharedPreferences
  Future<void> _loadJumuiya() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mahudhurioController.shared_jumuiya = prefs.getString('jumuiya_') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (kDebugMode) {
          // print("$didPop");
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appTheme.defaultcolor,
            foregroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              "Jumuiya ya ${mahudhurioController.shared_jumuiya}",
              style: TextStyle(
                fontSize: 16.fSize,
              ),
            ),
            centerTitle: true,
          ),
          body: Container(
              child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  child: TabBar(
                    padding: EdgeInsets.all(2),
                    indicatorColor: appTheme.defaultcolor,
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    labelColor: appTheme.defaultcolor,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12.fSize),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.church,
                            size: 16.fSize, color: appTheme.defaultcolor),
                        text: "${mahudhurioController.shared_jumuiya}",
                      ),
                      Tab(
                        icon: Icon(Icons.people,
                            size: 16.fSize, color: appTheme.defaultcolor),
                        text: "Mahudhulio Jumiyani",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 650.v,
                  child: TabBarView(
                    children: [menuOne(context), mahudhulio(context)],
                  ),
                )
              ],
            ),
          )),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            backgroundColor: Colors.white,
            unselectedItemColor: appTheme.defaultcolor,
            selectedItemColor: appTheme.defaultcolor,
            selectedFontSize: 12.fSize,
            unselectedFontSize: 12.fSize,
            items: [
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Get.to(HomeScreen(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.fadeIn //transition effect
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.v),
                    child: Icon(
                      FontAwesomeIcons.church,
                      size: 23.fSize,
                    ),
                  ),
                ),
                label: 'K/ndege',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Get.to(Taarifa_za_Michango(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.fadeIn //transition effect
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.v),
                    child: Icon(
                      FontAwesomeIcons.list,
                      size: 23.fSize,
                    ),
                  ),
                ),
                label: 'Taarifa za Michango',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Get.to(Jumuiya_sensa(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.fadeIn //transition effect
                        );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 2.v),
                    child: Icon(
                      FontAwesomeIcons.peopleGroup,
                      size: 23.fSize,
                    ),
                  ),
                ),
                label: 'Sensa',
                backgroundColor: Colors.white,
              ),
            ],
          )),
    );
  }

  menuOne(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.h, top: 15.v),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  height: 450.v,
                  decoration: BoxDecoration(color: Colors.white),
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0 // Number of columns
                        ),
                    children: [
                      SlideInLeft(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(Mwanajumuiya(),
                                    duration: Duration(milliseconds: 500),
                                    transition:
                                        Transition.fadeIn //transition effect
                                    );
                              },
                              child: Card(
                                  // color: appTheme.defaultcolor,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        topEnd: Radius.circular(15),
                                        topStart: Radius.circular(15),
                                        bottomEnd: Radius.circular(15),
                                        bottomStart: Radius.circular(15),
                                      ),

                                      // --------------------------------------------------------------------------------------------------------------------------

                                      side: BorderSide(
                                          color: appTheme.defaultcolor)),
                                  elevation: 10,
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.18,
                                    width: MediaQuery.of(context).size.width *
                                        0.18,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.18,
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      child: Center(
                                          child: Icon(
                                        Icons.person_add_alt_1_outlined,
                                        color: appTheme.defaultcolor,
                                      )),
                                    ),
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Mwanajumiya mpya",
                                    style: TextStyle(
                                        fontSize: 12.fSize,
                                        color: appTheme.defaultcolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SlideInDown(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(Mwanajumuiya_wote(),
                                        duration: Duration(milliseconds: 500),
                                        transition: Transition
                                            .fadeIn //transition effect
                                        );
                                  },
                                  child: Card(
                                      // color: appTheme.defaultcolor,
                                      shadowColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(15),
                                            topStart: Radius.circular(15),
                                            bottomEnd: Radius.circular(15),
                                            bottomStart: Radius.circular(15),
                                          ),

                                          // --------------------------------------------------------------------------------------------------------------------------

                                          side: BorderSide(
                                              color: appTheme.defaultcolor)),
                                      elevation: 10,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        child: Center(
                                          child: Icon(
                                            Icons.people_alt_outlined,
                                            color: appTheme.defaultcolor,
                                          ),
                                        ),
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Wanajumuiya",
                                        style: TextStyle(
                                            fontSize: 12.fSize,
                                            color: appTheme.defaultcolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ) //Text("Taarifa za Kilimo"),
                            ),
                      ),
                      SlideInDown(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "Comming Sooon",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  child: Card(
                                      // color: appTheme.defaultcolor,
                                      shadowColor: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusDirectional.only(
                                            topEnd: Radius.circular(15),
                                            topStart: Radius.circular(15),
                                            bottomEnd: Radius.circular(15),
                                            bottomStart: Radius.circular(15),
                                          ),

                                          // --------------------------------------------------------------------------------------------------------------------------

                                          side: BorderSide(
                                              color: appTheme.defaultcolor)),
                                      elevation: 10,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18,
                                        child: Center(
                                          child: Icon(
                                            Icons.money,
                                            color: appTheme.defaultcolor,
                                          ),
                                        ),
                                      )),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Michango",
                                        style: TextStyle(
                                            fontSize: 12.fSize,
                                            color: appTheme.defaultcolor,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ) //Text("Taarifa za Kilimo"),
                            ),
                      ),
                    ],
                  )),
            ]),
      ),
    );
  }

  taarifa_za_michango(BuildContext context) {
    return Container(
        child: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hakuna",
          style: TextStyle(
              color: appTheme.defaultcolor,
              fontSize: 12.fSize,
              fontWeight: FontWeight.bold),
        ),
      ],
    )));
  }

  shukrani() {
    HomeController ratibaController = Get.put(HomeController());
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: 0,
          top: 8.v,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.h, left: 8.h),
          child: Container(
            height: 580.v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.v,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: appTheme.defaultcolor,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.defaultcolor,
                              blurRadius: 3,
                            ),
                          ]),
                      child: Text("                              "),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.v,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Sukrani",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FormBuilder(
                  key: _fbKey,
                  //  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric()
                              ]),
                              keyboardType: TextInputType.number,
                              cursorColor: appTheme.defaultcolor,
                              name: 'fedha',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Kiasi cha Fedha",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: appTheme.defaultcolor,
                              name: 'maelezo',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Maelezo",
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fbKey.currentState!.validate()) {
                          Get.snackbar(
                            "Successfully",
                            "Account has been Updated Successfully",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color.fromARGB(255, 35, 135, 40),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        }

                        // _fbKey.currentState!.save();
                        // if (_fbKey.currentState!.validate()) {
                        //   print(_fbKey.currentState!.value);
                        // }

                        // Get.to(Register(),
                        //     duration: Duration(milliseconds: 500),
                        //     transition: Transition.fadeIn //transition effect
                        //     );
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
                          'Wasilisha',
                          style: TextStyle(fontSize: 16.fSize),
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
    );
  }

  zaka() {
    HomeController ratibaController = Get.put(HomeController());
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: 0,
          top: 8.v,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.h, left: 8.h),
          child: Container(
            height: 580.v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.v,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: appTheme.defaultcolor,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.defaultcolor,
                              blurRadius: 3,
                            ),
                          ]),
                      child: Text("                              "),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.v,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Zaka",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FormBuilder(
                  key: _fbKey,
                  //  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric()
                              ]),
                              keyboardType: TextInputType.number,
                              cursorColor: appTheme.defaultcolor,
                              name: 'fedha',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Kiasi cha Fedha",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: appTheme.defaultcolor,
                              name: 'maelezo',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Maelezo",
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fbKey.currentState!.validate()) {
                          Get.snackbar(
                            "Successfully",
                            "Account has been Updated Successfully",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color.fromARGB(255, 35, 135, 40),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        }

                        // _fbKey.currentState!.save();
                        // if (_fbKey.currentState!.validate()) {
                        //   print(_fbKey.currentState!.value);
                        // }

                        // Get.to(Register(),
                        //     duration: Duration(milliseconds: 500),
                        //     transition: Transition.fadeIn //transition effect
                        //     );
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
                          'Wasilisha',
                          style: TextStyle(fontSize: 16.fSize),
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
    );
  }

  bahasha() {
    HomeController ratibaController = Get.put(HomeController());
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: 0,
          top: 8.v,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.h, left: 8.h),
          child: Container(
            height: 580.v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.v,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: appTheme.defaultcolor,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.defaultcolor,
                              blurRadius: 3,
                            ),
                          ]),
                      child: Text("                              "),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.v,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Bahasha",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FormBuilder(
                  key: _fbKey,
                  //  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric()
                              ]),
                              keyboardType: TextInputType.number,
                              cursorColor: appTheme.defaultcolor,
                              name: 'fedha',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Kiasi cha Fedha",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: appTheme.defaultcolor,
                              name: 'maelezo',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Maelezo",
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fbKey.currentState!.validate()) {
                          Get.snackbar(
                            "Successfully",
                            "Account has been Updated Successfully",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color.fromARGB(255, 35, 135, 40),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        }

                        // _fbKey.currentState!.save();
                        // if (_fbKey.currentState!.validate()) {
                        //   print(_fbKey.currentState!.value);
                        // }

                        // Get.to(Register(),
                        //     duration: Duration(milliseconds: 500),
                        //     transition: Transition.fadeIn //transition effect
                        //     );
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
                          'Submit',
                          style: TextStyle(fontSize: 16.fSize),
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
    );
  }

  michango_mingine() {
    HomeController ratibaController = Get.put(HomeController());
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(25),
          topStart: Radius.circular(25),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
          bottom: 0,
          top: 8.v,
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 8.h, left: 8.h),
          child: Container(
            height: 580.v,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.v,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: appTheme.defaultcolor,
                          boxShadow: [
                            BoxShadow(
                              color: appTheme.defaultcolor,
                              blurRadius: 3,
                            ),
                          ]),
                      child: Text("                              "),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.v,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: appTheme.defaultcolor.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Michango Mingine",
                            style: TextStyle(
                                color: appTheme.defaultcolor,
                                fontSize: 12.fSize,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FormBuilder(
                  key: _fbKey,
                  //  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric()
                              ]),
                              keyboardType: TextInputType.number,
                              cursorColor: appTheme.defaultcolor,
                              name: 'fedha',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Kiasi cha Fedha",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              border: Border.all(color: appTheme.defaultcolor)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.h, right: 8.h),
                            child: FormBuilderTextField(
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              keyboardType: TextInputType.visiblePassword,
                              cursorColor: appTheme.defaultcolor,
                              name: 'maelezo',
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.15)),
                                ),
                                labelText: "Maelezo",
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
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fbKey.currentState!.validate()) {
                          Get.snackbar(
                            "Successfully",
                            "Account has been Updated Successfully",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color.fromARGB(255, 35, 135, 40),
                            colorText: Colors.white,
                            icon: const Icon(Icons.error, color: Colors.white),
                            shouldIconPulse: true,
                            barBlur: 20,
                          );
                        }

                        // _fbKey.currentState!.save();
                        // if (_fbKey.currentState!.validate()) {
                        //   print(_fbKey.currentState!.value);
                        // }

                        // Get.to(Register(),
                        //     duration: Duration(milliseconds: 500),
                        //     transition: Transition.fadeIn //transition effect
                        //     );
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
                          'Submit',
                          style: TextStyle(fontSize: 16.fSize),
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
    );
  }

  mahudhulio(BuildContext context) {
    JumuiyaController mahudhurioController = Get.put(JumuiyaController());

    //HomeController ratibaController = Get.put(HomeController());

    return Padding(
      padding: EdgeInsets.only(top: 12.v, left: 10.h, right: 10.h),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 82.v,
              decoration: BoxDecoration(
                  color: appTheme.defaultcolor.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(8)),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 5.h,
                        ),
                        Icon(
                          Icons.info,
                          color: appTheme.defaultcolor,
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        Text(
                          "Mahudhulio jumuiyani",
                          style: TextStyle(
                              fontSize: 13.fSize, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                height: 330.v,
                child: Obx(
                  () => mahudhurioController.wanaparokiaList.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              mahudhurioController.wanaparokiaList.length,
                          itemBuilder: (context, int index) {
                            return CheckboxListTile(
                              shape: CircleBorder(),
                              title: Text(
                                mahudhurioController
                                    .wanaparokiaList[index].majinaKamili
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 14.fSize,
                                    color: appTheme.defaultcolor),
                              ),
                              value: mahudhurioController
                                  .wanaparokiaList[index].isChecked,
                              onChanged: (bool? value) {
                                if (mahudhurioController.items.contains(
                                    mahudhurioController
                                        .wanaparokiaList[index].majinaKamili
                                        .toString())) {
                                  mahudhurioController.items.remove(
                                      mahudhurioController
                                          .wanaparokiaList[index].majinaKamili
                                          .toString());
                                } else {
                                  mahudhurioController.items.add(
                                      mahudhurioController
                                          .wanaparokiaList[index].majinaKamili
                                          .toString());
                                }

                                setState(() {
                                  mahudhurioController.wanaparokiaList[index]
                                      .isChecked = value!;
                                });
                              },
                            );
                          })
                      : BounceInUp(
                          child: GFLoader(
                              size: GFSize.SMALL,
                              loaderstrokeWidth: 2,
                              type: GFLoaderType.ios),
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.v),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    mahudhurioController.insertData();
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(appTheme.defaultcolor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Wasilisha',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
