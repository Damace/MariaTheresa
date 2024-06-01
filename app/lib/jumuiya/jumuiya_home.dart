// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:convert';
import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:app/APIs/jumuiya/api_links.dart';
import 'package:app/APIs/jumuiya/mahudhulio_modal.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/jumuiya/jumuiya.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                                  onTap: () {
                                    shukrani();
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
            height: 520.v,
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
                Row(
                  children: [
                    Text("Sukrani"),
                  ],
                ),
                FormBuilder(
                  key: _fbKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'kiasi',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Kiasi Tsh",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.15),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: appTheme.defaultcolor)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.h, right: 8.h),
                          child: FormBuilderTextField(
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: appTheme.defaultcolor,
                            name: 'kiasi',
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.15)),
                              ),
                              labelText: "Kiasi Tsh",
                              labelStyle: TextStyle(
                                  color: appTheme.defaultcolor,
                                  fontSize: 12.fSize),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _fbKey.currentState!.save();
                              if (_fbKey.currentState!.validate()) {
                                print(_fbKey.currentState!.value);
                              }

                              // Get.to(Register(),
                              //     duration: Duration(milliseconds: 500),
                              //     transition: Transition.fadeIn //transition effect
                              //     );
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  appTheme.defaultcolor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                shape: CircleBorder(),
                                title: Text(mahudhurioController
                                    .mahudhurioList[index].mwanajumuiya),
                                value: mahudhurioController
                                    .mahudhurioList[index].isChecked,
                                onChanged: (bool? value) {
                                  if (mahudhurioController.items.contains(
                                      mahudhurioController.mahudhurioList[index]
                                          .mwanajumuiya)) {
                                    mahudhurioController.items.remove(
                                        mahudhurioController
                                            .mahudhurioList[index]
                                            .mwanajumuiya);
                                  } else {
                                    mahudhurioController.items.add(
                                        mahudhurioController
                                            .mahudhurioList[index]
                                            .mwanajumuiya);
                                  }

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
