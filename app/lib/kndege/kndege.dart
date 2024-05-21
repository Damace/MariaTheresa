import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/kndege/kndege_contrroller.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Home extends StatelessWidget {
  buildBottomNavigationMenu(context, kndege_controller) {
    return Obx(() => BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: kndege_controller.changeTabIndex,
          currentIndex: kndege_controller.tabIndex.value,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          selectedItemColor: appTheme.defaultcolor,
          selectedFontSize: 12.fSize,
          unselectedFontSize: 12.fSize,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2.v),
                child: Icon(
                  Icons.home_outlined,
                  size: 23.0.fSize,
                ),
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2.v),
                child: Icon(
                  Icons.attach_money_outlined,
                  size: 23.0.fSize,
                ),
              ),
              label: 'Michango',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2.v),
                child: Icon(
                  Icons.tv_rounded,
                  size: 23.0.fSize,
                ),
              ),
              label: 'Kndege TV',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2.v),
                child: Icon(
                  Icons.people_outlined,
                  size: 23.0.fSize,
                ),
              ),
              label: 'Wageni',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2.v),
                child: Icon(
                  Icons.person_2_outlined,
                  size: 23.0.fSize,
                ),
              ),
              label: 'Me',
              backgroundColor: Colors.white,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final KndegeController kndege_controller =
        Get.put(KndegeController(), permanent: false);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.93),
      bottomNavigationBar:
          buildBottomNavigationMenu(context, kndege_controller),
      body: Obx(() => IndexedStack(
            index: kndege_controller.tabIndex.value,
            children: [
              HomeScreen(),
              Michango(),
              Tv(),
              Wageni(),
              Profile(),
            ],
          )),
    );
  }
}
