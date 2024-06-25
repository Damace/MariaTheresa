// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/matangazo/matangazo_controller.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';

class Mwanajumuiya_wote extends StatefulWidget {
  @override
  State<Mwanajumuiya_wote> createState() => _Mwanajumuiya_wote();
}

class _Mwanajumuiya_wote extends State<Mwanajumuiya_wote> {
  final formkey = GlobalKey<FormState>();

  // wanajumuiyaController = Get.put(JumuiyaController());

  JumuiyaController wanajumuiyaController = Get.put(JumuiyaController());

  @override
  void initState() {
    super.initState();

    wanajumuiyaController.fetchWanaparokia();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wanajumuiya waliosajiliwa",
          style: TextStyle(fontSize: 16.fSize),
        ),
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            children: [
              Obx(
                () => wanajumuiyaController.wanaparokiaList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount:
                              wanajumuiyaController.wanaparokiaList.length,
                          itemBuilder: (context, index) {
                            return Text(
                              "${wanajumuiyaController.wanaparokiaList[index].majinaKamili}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14.fSize,
                                  color: appTheme.defaultcolor,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      )
                    : BounceInUp(
                        child: GFLoader(
                            size: GFSize.SMALL,
                            loaderstrokeWidth: 2,
                            type: GFLoaderType.ios),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
