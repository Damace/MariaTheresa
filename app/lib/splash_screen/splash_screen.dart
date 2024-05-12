// ignore_for_file: prefer_const_constructors, unnecessary_import

import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/maria.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: GFLoader(
                size: GFSize.SMALL,
                loaderstrokeWidth: 2,
                type: GFLoaderType.ios)
        ),
      ))
      ],
    );
  }
}
