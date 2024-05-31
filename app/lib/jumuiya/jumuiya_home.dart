// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:http/http.dart' as http;

class Jumuiya_home extends StatefulWidget {
  @override
  State<Jumuiya_home> createState() => _Jumuiya_home();
}

class _Jumuiya_home extends State<Jumuiya_home> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  JumuiyaController mahudhurioController = Get.put(JumuiyaController());

  List<TextEditingController> _fullnameController = [];

  late Future<List<Mahudhurio>> f;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.defaultcolor,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Jumuiya ya Mt.Alberto",
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
                    fontWeight: FontWeight.normal, fontSize: 14.fSize),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    //icon: Icon(Icons.sell_rounded),
                    text: "Mt.Albeto Hutado",
                  ),
                  Tab(
                    //icon: Icon(Icons.newspaper),
                    text: "Mahudhulio kila Jumamosi",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Sensa",
                                        overflow: TextOverflow.ellipsis,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Shukrani",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "Zaka",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Bahasha",
                                          style: TextStyle(
                                              fontSize: 12.fSize,
                                              color: appTheme.defaultcolor),
                                        ))
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Michango mingine",
                                          style: TextStyle(
                                              fontSize: 13.5.fSize,
                                              color: appTheme.defaultcolor,
                                              fontWeight: FontWeight.w500),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mahudhulio ya Jumamosi ya Tarehe 5 / 8 /2024",
                        style: TextStyle(
                            fontSize: 13.fSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: FormBuilder(
                key: _fbKey,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8))),
                  height: 460.v,
                  child: Obx(
                    () => mahudhurioController.mahudhurioList.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                mahudhurioController.mahudhurioList.length,
                            itemBuilder: (context, int index) {
                              return CheckboxListTile(
                                title: Text(mahudhurioController
                                    .mahudhurioList[index].mwanajumuiya),
                                value: mahudhurioController
                                    .mahudhurioList[index].isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    mahudhurioController.mahudhurioList[index]
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
            ),
            Spacer(flex: 3),
            Padding(
              padding: EdgeInsets.only(bottom: 10.v),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // insertData();
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
                      'Submit',
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
