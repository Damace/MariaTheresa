// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Michango extends StatefulWidget {
  @override
  State<Michango> createState() => _Michango();
}

class _Michango extends State<Michango> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.defaultcolor,
          foregroundColor: Colors.white,
          title: Text(
            "Michango",
            style: TextStyle(
              fontSize: 16.fSize,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 3.h, top: 10.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 340.v,
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
                                  onTap: () {},
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
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.18,
                                          child: Center(
                                            child: Image(
                                              image: const AssetImage(
                                                  "assets/images/agri.png"),
                                              height: 50,
                                              width: 50,
                                              // fit: BoxFit.cover,
                                            ),
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
                                        "Sadaka",
                                        style: TextStyle(
                                          fontSize: 14.fSize,
                                          color: Colors.black,
                                        ),
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
                                      onTap: () {},
                                      child: Card(
                                          // color: appTheme.defaultcolor,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(15),
                                                bottomEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(15),
                                              ),

                                              // --------------------------------------------------------------------------------------------------------------------------

                                              side: BorderSide(
                                                  color:
                                                      appTheme.defaultcolor)),
                                          elevation: 10,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            child: Center(
                                              child: Image(
                                                image: const AssetImage(
                                                    "assets/images/agri.png"),
                                                height: 50,
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Zaka",
                                            style: TextStyle(
                                              fontSize: 14.fSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ) //Text("Taarifa za Kilimo"),
                                ),
                          ),
                          SlideInRight(
                            child: Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Card(
                                          // color: appTheme.defaultcolor,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(15),
                                                bottomEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(15),
                                              ),

                                              // --------------------------------------------------------------------------------------------------------------------------

                                              side: BorderSide(
                                                  color:
                                                      appTheme.defaultcolor)),
                                          elevation: 10,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            child: Center(
                                              child: Image(
                                                image: const AssetImage(
                                                    "assets/images/agri.png"),
                                                height: 50,
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Bahasha",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14.fSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ) //Text("Taarifa za Kilimo"),
                                ),
                          ),
                          SlideInLeft(
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Card(
                                          // color: appTheme.defaultcolor,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(15),
                                                bottomEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(15),
                                              ),

                                              // --------------------------------------------------------------------------------------------------------------------------
                                              side: BorderSide(
                                                  color:
                                                      appTheme.defaultcolor)),
                                          elevation: 10,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            child: Center(
                                              child: Image(
                                                image: const AssetImage(
                                                    "assets/images/agri.png"),
                                                height: 50,
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Shukrani",
                                            style: TextStyle(
                                              fontSize: 14.fSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ) //Text("Taarifa za Kilimo"),
                                ),
                          ),
                          SlideInUp(
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Card(
                                          // color: appTheme.defaultcolor,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(15),
                                                bottomEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(15),
                                              ),

                                              // --------------------------------------------------------------------------------------------------------------------------

                                              side: BorderSide(
                                                  color:
                                                      appTheme.defaultcolor)),
                                          elevation: 10,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            child: Center(
                                              child: Image(
                                                image: const AssetImage(
                                                    "assets/images/agri.png"),
                                                height: 50,
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Ujenzi",
                                            style: TextStyle(
                                              fontSize: 14.fSize,
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ) //Text("Taarifa za Kilimo"),
                                ),
                          ),
                          SlideInRight(
                            child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      child: Card(
                                          // color: appTheme.defaultcolor,
                                          shadowColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                topEnd: Radius.circular(15),
                                                topStart: Radius.circular(15),
                                                bottomEnd: Radius.circular(15),
                                                bottomStart:
                                                    Radius.circular(15),
                                              ),

                                              // --------------------------------------------------------------------------------------------------------------------------

                                              side: BorderSide(
                                                  color:
                                                      appTheme.defaultcolor)),
                                          elevation: 10,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            child: Center(
                                              child: Image(
                                                image: const AssetImage(
                                                    "assets/images/agri.png"),
                                                height: 50,
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              "Michango mingine",
                                              style: TextStyle(
                                                fontSize: 14.fSize,
                                                color: Colors.black,
                                              ),
                                            ))
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
        ),
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
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(Michango(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.v),
                  child: Icon(
                    FontAwesomeIcons.sackDollar,
                    size: 23.fSize,
                  ),
                ),
              ),
              label: 'Michango',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(Wageni(),
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
              label: 'Jumuiya',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(Profile(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.v),
                  child: Icon(
                    FontAwesomeIcons.user,
                    size: 23.fSize,
                  ),
                ),
              ),
              label: 'Me',
              backgroundColor: Colors.white,
            ),
          ],
        ));
  }
}
