// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/profile_content/bahasha.dart';
import 'package:app/profile_content/sadaka.dart';
import 'package:app/profile_content/shukrani.dart';
import 'package:app/profile_content/ujenzi.dart';
import 'package:app/profile_content/zaka_screen.dart';
import 'package:app/profile_content/michango_mingine.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.defaultcolor,
          foregroundColor: Colors.white,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 16.fSize,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: Container(
                height: 25,
                width: 25,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    color: appTheme.defaultcolor,
                    width: double.infinity,
                    height: 200.v,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20.h, left: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100.v,
                                width: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.person_2_outlined,
                                  size: 32,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: null,
                    left: 30.0.h,
                    right: 30.0.h,
                    bottom: 00.0.v,
                    child: Container(
                      height: 55.v,
                      width: 400.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: BounceInDown(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "+255 762700405",
                                  style: TextStyle(
                                      color: appTheme.defaultcolor,
                                      fontSize: 16.fSize,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 2.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              tabSection(context)
            ],
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

  tabSection(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            child: TabBar(
              padding: EdgeInsets.zero,
              indicatorColor: appTheme.defaultcolor,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: appTheme.defaultcolor,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              unselectedLabelColor: Colors.black,
              tabs: [
                FadeInLeft(
                  child: Tab(
                    icon: Icon(Icons.person_2_outlined, size: 25),
                    text: "Details",
                  ),
                ),
                FadeInLeft(
                  child: Tab(
                    icon: Icon(
                      FontAwesomeIcons.sackDollar,
                      size: 25,
                    ),
                    text: "Michango",
                  ),
                ),
                FadeInLeft(
                  child: Tab(
                    icon: Icon(Icons.people, size: 25),
                    text: "Jumuiya",
                  ),
                ),
                FadeInLeft(
                  child: Tab(
                    icon: Icon(Icons.people, size: 25),
                    text: "Chama cha Kitume",
                  ),
                ),
                FadeInLeft(
                  child: Tab(
                    icon: Icon(Icons.settings_outlined, size: 25),
                    text: "Settings",
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 380.v,
            child: TabBarView(
              children: [
                details(context),
                michango(context),
                jumuiya(context),
                kitume(context),
                setting(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  details(context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.h, right: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  height: 150.v,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Alex Boniphace Mwakalikamo",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.fSize),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.h),
                            child: Icon(
                              Icons.verified,
                              size: 16,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.v,
                      ),
                      Container(
                        height: 30.v,
                        width: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            "Taarifa Zaidi",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  michango(context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Zaka(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Zaka",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Shukrani(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Shukrani",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Bahasha(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Bahasha",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Sadaka(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Sadaka",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Ujenzi(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Ujenzi",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(MichangoMingine(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Michango Mingine",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              SizedBox(
                height: 10.v,
              ),
            ],
          ),
        ),
      ),
    );
  }

  jumuiya(context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5.h, right: 5.h),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.15),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  width: double.infinity,
                  height: 150.v,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.v,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mt. Albeto Hutado",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.fSize),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.h),
                            child: Icon(
                              Icons.verified,
                              size: 16,
                              color: Colors.green,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.v,
                      ),
                      Container(
                        height: 30.v,
                        width: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: Text(
                            "Mahudhulio",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  kitume(context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.h, right: 5.h),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.15),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      width: double.infinity,
                      height: 100.v,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "UWAKA",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.fSize),
                              ),
                              SizedBox(
                                width: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8.h),
                                child: Icon(
                                  Icons.verified,
                                  size: 16,
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Vyama va Hiyali",
                    style: TextStyle(
                        fontSize: 14.fSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 175.v,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Zaka(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Karmatic Kathoric",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Shukrani(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Shukrani",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Bahasha(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Bahasha",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Sadaka(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Sadaka",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Ujenzi(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Ujenzi",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(MichangoMingine(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                        child: Container(
                          height: 30.v,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person_2,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Michango Mingine",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(
                      height: 10.v,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setting(context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Zaka(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Change Language",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Shukrani(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Change Theme",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.fSize,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(Bahasha(),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.fadeIn //transition effect
                      );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                  child: Container(
                    height: 30.v,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person_2,
                              size: 25.fSize,
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: 16.fSize,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
