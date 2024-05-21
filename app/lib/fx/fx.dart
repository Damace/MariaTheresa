// ignore_for_file: prefer_const_constructors

import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Fx {
  ss() {
    return Scaffold(
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
              //jumuiya(context);
              // Get.to(Wageni(),
              //     duration: Duration(milliseconds: 500),
              //     transition: Transition.fadeIn //transition effect
              //     );
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
