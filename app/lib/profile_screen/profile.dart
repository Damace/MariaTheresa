// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/login/login.dart';
import 'package:app/maoni/maoni.dart';
import 'package:app/profile_content/bahasha.dart';
import 'package:app/profile_screen/profile_controller.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:app/jumuiya/jumuiya_login.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  final formkey = GlobalKey<FormState>();
  ProfileController dataController = Get.put(ProfileController());

  String jina = '';
  String namba = '';
  String jumuiya_a = '';

  @override
  void initState() {
    super.initState();
    dataController.fetchMapadre();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    pref_get();
  }

  Future<void> pref_get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      jina = prefs.getString('jina') ?? '';
      namba = prefs.getString("phone_number") ?? '';
      jumuiya_a = prefs.getString("jumuiya") ?? '';
    });
  }

  // pref_get() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   var jina = pref.getString("jina");
  //   var namba = pref.getString("phone_number");
  //   var jumuiya = pref.getString("jumuiya");

  // }

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
                    height: 180.v,
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
                                  //Icons.person_2_outlined,
                                  FontAwesomeIcons.user,
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
                                  "${jina}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.fSize),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.h),
                                  child: Icon(
                                    Icons.verified,
                                    size: 16,
                                    color: appTheme.defaultcolor,
                                  ),
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
              label: 'K/ndege',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Get.to(Jumuiya_(),
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
                  // jumuiya(context);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 2.v),
                  child: Icon(
                    FontAwesomeIcons.user,
                    size: 23.fSize,
                  ),
                ),
              ),
              label: '${jina}',
              backgroundColor: Colors.white,
            ),
          ],
        ));
  }

  tabSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Jumuiya ya ${jumuiya_a}",
                    style: TextStyle(
                        fontSize: 14.fSize, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 480.v,
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
                        padri(context);
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
                                    "Mawasiliano ya Padri",
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
                    // Padding(
                    //   padding: EdgeInsets.only(left: 10.0),
                    //   child: Divider(
                    //     color: Colors.black.withOpacity(0.1),
                    //   ),
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     jumuiya(context);
                    //   },
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 10.0.h, right: 10.0.h),
                    //     child: Container(
                    //       height: 30.v,
                    //       width: double.infinity,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Row(
                    //             mainAxisAlignment: MainAxisAlignment.start,
                    //             children: [
                    //               Icon(
                    //                 Icons.people_alt_outlined,
                    //                 size: 25.fSize,
                    //               ),
                    //               SizedBox(
                    //                 width: 10.h,
                    //               ),
                    //               Text(
                    //                 "Viongozi wa Jumuiya",
                    //                 style: TextStyle(
                    //                     fontSize: 16.fSize,
                    //                     fontWeight: FontWeight.w500),
                    //               )
                    //             ],
                    //           ),
                    //           Icon(
                    //             Icons.arrow_forward_ios,
                    //             size: 16.fSize,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Maoni(),
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
                                    Icons.mail,
                                    size: 25.fSize,
                                  ),
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Text(
                                    "Maoni",
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
                        Get.to(Login_(),
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
                                    Icons.logout_outlined,
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
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16.fSize,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.v,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Mitandao ya Kijamii",
                                style: TextStyle(
                                    fontSize: 14.fSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Row(children: [
                        FadeInLeft(
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  FontAwesomeIcons.youtube,
                                  color: Colors.red,
                                  size: 50.fSize,
                                ),
                                Text(
                                  "Kndege Parish",
                                  style: TextStyle(
                                      fontSize: 11.5.fSize,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15.h),
                        FadeInLeft(
                          child: Container(
                            child: Column(
                              children: [
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue,
                                  size: 50.fSize,
                                ),
                                Text(
                                  "Kndege Parish",
                                  style: TextStyle(
                                      fontSize: 11.5.fSize,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15.h),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  padri(BuildContext context) {
    ProfileController dataController = Get.put(ProfileController());

    showModalBottomSheet(
      isDismissible: true,
      enableDrag: false,
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
          top: 8,
        ),
        child: Container(
          height: 300.h,
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
              Card(
                elevation: 0,
                child: Container(
                  height: 40.v,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.church,
                          size: 16.fSize,
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Text(
                          "Viongozi wa Kiroho",
                          style: TextStyle(
                            fontSize: 12.fSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.06),
              ),
              Obx(
                () => dataController.mapadriList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataController.mapadriList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: Text(
                                  "${dataController.mapadriList[index].majinaKamili}",
                                  style: TextStyle(
                                      fontSize: 16.fSize,
                                      color: appTheme.defaultcolor),
                                ),
                                trailing: Text(
                                    "${dataController.mapadriList[index].cheo}",
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        color: appTheme.defaultcolor)),
                                title: Text(
                                    "${dataController.mapadriList[index].nambaYaSimu}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 16.fSize,
                                        color: appTheme.defaultcolor)));
                          },
                        ),
                      )
                    : BounceInUp(
                        child: GFLoader(
                            size: GFSize.SMALL,
                            loaderstrokeWidth: 2,
                            type: GFLoaderType.ios),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  jumuiya(BuildContext context) {
    //HomeController formController = Get.put(HomeController());

    showModalBottomSheet(
      isDismissible: true,
      enableDrag: false,
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
          top: 8,
        ),
        child: Container(
          height: 300.h,
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
              Card(
                elevation: 0,
                child: Container(
                  height: 40.v,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          FontAwesomeIcons.church,
                          size: 16.fSize,
                        ),
                        SizedBox(
                          width: 15.h,
                        ),
                        Text(
                          "Taarifa binafi",
                          style: TextStyle(
                            fontSize: 12.fSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black.withOpacity(0.06),
              ),
              SizedBox(
                height: 10,
              ),
              // Obx(
              //   () => formController.fomuList.isNotEmpty
              //       ? Expanded(
              //           child: ListView.builder(
              //             //shrinkWrap: true,
              //             itemCount: formController.fomuList.length,
              //             itemBuilder: (context, index) {
              //               return ListTile(
              //                   leading: const Icon(
              //                     FontAwesomeIcons.filePdf,
              //                     color: Colors.red,
              //                     size: 16,
              //                   ),
              //                   trailing: formController.progress != null
              //                       ? CircularProgressIndicator()
              //                       : InkWell(
              //                           onTap: () {
              //                             Get.back();
              //                             downloadfile(
              //                                 formController
              //                                     .fomuList[index].preview
              //                                     .toString(),
              //                                 formController
              //                                     .fomuList[index].jina
              //                                     .toString());
              //                           },
              //                           child: Icon(
              //                             FontAwesomeIcons.download,
              //                             color: appTheme.defaultcolor,
              //                             size: 25.fSize,
              //                           ),
              //                         ),
              //                   title: Text(
              //                     "${formController.fomuList[index].jina}",
              //                     overflow: TextOverflow.ellipsis,
              //                     style: TextStyle(
              //                         fontSize: 14.fSize,
              //                         color: appTheme.defaultcolor,
              //                         fontWeight: FontWeight.bold),
              //                   ));
              //             },
              //           ),
              //         )
              //       : BounceInUp(
              //           child: GFLoader(
              //               size: GFSize.SMALL,
              //               loaderstrokeWidth: 2,
              //               type: GFLoaderType.ios),
              //         ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
