// ignore_for_file: prefer_const_constructors, unused_import

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.defaultcolor0,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BounceInDown(
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
                  // BounceInUp(
                  //   child: GFLoader(
                  //       size: GFSize.SMALL,
                  //       loaderstrokeWidth: 2,
                  //       type: GFLoaderType.ios),
                  // ),
                ],
              ),
            )));
  }
}
