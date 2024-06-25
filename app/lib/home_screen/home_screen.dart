// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import

import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/jumuiya/jumuiya_login.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/maoni/maoni.dart';
import 'package:app/matangazo/matangazo.dart';
import 'package:app/matangazo/matangazo_controller.dart';
import 'package:app/matukio/matukio.dart';
import 'package:app/modals/all_modals.dart';
import 'package:app/notification/notification.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/vyama_vya_kitume/kitume.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:marquee/marquee.dart';
import 'package:getwidget/getwidget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  HomeController connections = Get.put(HomeController());
  MatangazoController dataController = Get.put(MatangazoController());

  String title = '';
  String jina = '';
  String namba = '';
  String jumuiya_a = '';

  @override
  void initState() {
    super.initState();
    connections.fetchFoms();
    connections.fetchMatango();
    connections.fetchMatangazo();
    connections.fetchMatukio();
    dataController.fetchMatangazo_file();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    //title = tangazoMain();

    //print(title);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // _loadJina();
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

  // // Load username from SharedPreferences
  // Future<void> _loadJina() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     jina = prefs.getString('jina') ?? 'me';
  //   });
  // }

  final formkey = GlobalKey<FormState>();

  late String dropdown;

  final List<String> imageList = [
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481405_altare.jpg",
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481383_office.jpg",
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481362_kanisa.jpg",
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481339_ukumbi.jpg",
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481405_altare.jpg",
    "https://app.parokiayakiwanjachandege.or.tz/uploaded/1718481383_office.jpg"
  ];

  bool vsb = false;

  final Tv youtubeChannel = new Tv();

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  setCategory(String cat) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('catego', "${cat}");
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (kDebugMode) {
          // print("$didPop");
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.93),
          body: RefreshIndicator(
            backgroundColor: Colors.white,
            color: appTheme.defaultcolor,
            strokeWidth: 1.75,
            onRefresh: _refreshData,
            child: Container(
              // color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GFCarousel(
                        autoPlay: true,
                        hasPagination: true,
                        viewportFraction: 1.0,
                        aspectRatio: 2,
                        activeIndicator: Colors.white,
                        items: imageList.map(
                          (url) {
                            return Container(
                              child: ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: url,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                        onPageChanged: (index) {
                          setState(() {
                            index;
                          });
                        },
                      ),
                      SizedBox(
                        height: 75.v,
                      ),
                      contents(context)
                    ],
                  ),
                  Positioned(
                    top: 155.h,
                    left: null,
                    right: 10.h,
                    bottom: null,
                    child: Container(
                        height: 95.v,
                        width: 350.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                  color: appTheme.defaultcolor.withOpacity(0.4),
                                  spreadRadius: 0.5,
                                  offset: Offset(0, 0.6))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.v,
                                  ),
                                  GFButton(
                                    textStyle: TextStyle(
                                        fontSize: 11.5.fSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    color:
                                        appTheme.defaultcolor.withOpacity(0.15),
                                    onPressed: () {
                                      ratiba(context);
                                    },
                                    text: "Ratiba za Ibada",
                                    icon: Icon(
                                      FontAwesomeIcons.listUl,
                                      size: 18.fSize,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20.v, bottom: 20.v),
                              child: VerticalDivider(color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.v,
                                  ),
                                  GFButton(
                                    textStyle: TextStyle(
                                        fontSize: 11.5.fSize,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    color:
                                        appTheme.defaultcolor.withOpacity(0.15),
                                    onPressed: () {
                                      fomu_za_huduma(context);
                                    },
                                    text: "Fomu za huduma",
                                    icon: Icon(
                                      FontAwesomeIcons.filePdf,
                                      size: 18.fSize,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    top: 205.h,
                    left: null,
                    right: 155.h,
                    bottom: null,
                    child: Container(
                      height: 60.v,
                      width: 60.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: appTheme.defaultcolor.withOpacity(0.4),
                                spreadRadius: 0.5,
                                offset: Offset(0, 0.6))
                          ],
                          shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          Get.to(Maoni(),
                              duration: Duration(milliseconds: 500),
                              transition: Transition.fadeIn //transition effect
                              );
                        },
                        child: Icon(
                          Icons.mail,
                          color: appTheme.defaultcolor.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 35.h,
                  //   left: null,
                  //   right: 7.h,
                  //   bottom: null,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Get.to(Notification_screen(),
                  //           duration: Duration(milliseconds: 500),
                  //           transition: Transition.fadeIn //transition effect
                  //           );
                  //     },
                  //     child: Badge(
                  //       label: Text("0"),
                  //       child: Icon(
                  //         Icons.notifications_on_outlined,
                  //         color: Colors.white,
                  //         size: 25,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                      top: 35.h,
                      left: 7.0,
                      right: null,
                      bottom: null,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: PopupMenuButton(
                            child: Icon(
                              Icons.sort,
                              color: Colors.white,
                              size: 35,
                            ),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.share_outlined,
                                    size: 23.fSize,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text("Share"),
                                  )
                                ],
                              )),
                            ],
                          ))),

                  //dwambura@gmail.com

                  Positioned(
                    top: 98.h,
                    left: 7.0,
                    right: null,
                    bottom: null,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.h,
                            height: 40.v,
                            child: Center(
                              child: Image(
                                image: AssetImage("assets/images/jesuit.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.9),
                                border: Border.all(
                                    color: Color.fromARGB(255, 190, 148, 9))),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Jimbo Kuu Katoriki Dodoma",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 247, 222, 5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.fSize,
                                  )),
                              Text(
                                  "Parokia ya Mwenyeheri Maria Theresa Ledochwosker",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 247, 222, 5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.fSize,
                                  )),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
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
                label: 'Profile',
                backgroundColor: Colors.white,
              ),
            ],
          )),
    );
  }

  void downloadfile(String myFile, String name) async {
    var status = await Permission.storage.request();
    if (status == PermissionStatus.granted) {
      FileDownloader.downloadFile(
          url: myFile,
          name: name,
          onProgress: (String? filename, double process) {
            Fluttertoast.showToast(
                msg: "Downloading.... ${process}%",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);

            //  print("FILE $filename HAS PROGRESS $process");
          },
          onDownloadCompleted: (String path) {
            Fluttertoast.showToast(
                msg: "Downloading Completed",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 1,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          onDownloadError: (String error) {
            print("DOWNLOAD ERROR $error");
          });
    } else {
      print("Permission is not granted");
    }
  }

  contents(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      width: double.infinity,
      height: 520.v,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 10.v, right: 4.h, left: 4.h, bottom: 10.v),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Matangazo",
                      style: TextStyle(
                          color: appTheme.defaultcolor,
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Matanga_zo(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Text("",
                          style: TextStyle(
                              color: appTheme.defaultcolor,
                              fontSize: 12.5.fSize,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                )),
            Container(
              height: 150.v,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.v),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          FadeInLeft(
                            child: Container(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setCategory("sadaka");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "Sadaka",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                          child: Icon(
                                        Icons.money_outlined,
                                        color: appTheme.defaultcolor,
                                      )),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "Sadaka",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
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
                                  InkWell(
                                    onTap: () {
                                      setCategory("ndoa");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "Ndoa",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                        child: Center(
                                            child: Icon(
                                          Icons.favorite_outline_outlined,
                                          color: appTheme.defaultcolor,
                                        )),
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "Ndoa",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
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
                                  InkWell(
                                    onTap: () {
                                      setCategory("usafi");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "Usafi",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                        child: Center(
                                            child: Icon(
                                          Icons.cleaning_services_outlined,
                                          color: appTheme.defaultcolor,
                                        )),
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "Usafi",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
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
                                  InkWell(
                                    onTap: () {
                                      setCategory("vkitume");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "V.kitume",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                          child: Icon(
                                        Icons.people_alt_outlined,
                                        color: appTheme.defaultcolor,
                                      )),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "V.Kitume",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
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
                                  InkWell(
                                    onTap: () {
                                      setCategory("jumuiya");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "Jumuiya",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                        child: Center(
                                            child: Icon(
                                          Icons.people_rounded,
                                          color: appTheme.defaultcolor,
                                        )),
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "Jumuiya",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
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
                                  InkWell(
                                    onTap: () {
                                      setCategory("kwaya");
                                      Get.to(Matanga_zo(),
                                          arguments: {
                                            "category": "Kwaya",
                                          },
                                          duration: Duration(milliseconds: 500),
                                          transition: Transition
                                              .fadeIn //transition effect
                                          );
                                    },
                                    child: Container(
                                      width: 50.h,
                                      height: 50.v,
                                      child: Center(
                                          child: Icon(
                                        Icons.people_alt_outlined,
                                        color: appTheme.defaultcolor,
                                      )),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black)),
                                    ),
                                  ),
                                  Text(
                                    "Kwaya",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 350.h,
                          height: 50.v,
                          decoration: BoxDecoration(
                            color: appTheme.defaultcolor.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                          child: BounceInDown(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.info_outline),
                                    SizedBox(width: 5.h),
                                    Container(
                                      width: 200.h,
                                      height: 20.v,
                                      child: Marquee(
                                        text: 'Matangazo yote yanapatikana  >>',
                                        style: TextStyle(
                                            fontSize: 13.fSize,
                                            fontWeight: FontWeight.bold),
                                        scrollAxis: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        blankSpace: 20.0,
                                        velocity: 20.0,
                                        pauseAfterRound: Duration(seconds: 5),
                                        startPadding: 25.0,
                                        accelerationDuration:
                                            Duration(seconds: 1),
                                        accelerationCurve:
                                            Curves.linearToEaseOut,
                                        decelerationDuration:
                                            Duration(milliseconds: 1000),
                                        decelerationCurve: Curves.easeIn,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 25.v,
                                  width: 60.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        matangazo_mengine(context);
                                      },
                                      child: Text(
                                        "Hapa",
                                        style: TextStyle(fontSize: 12.fSize),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //--------------------------------------------------------------------------------------------------------

            Container(
              height: 200.v,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.v),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          top: 10.v,
                          bottom: 10.v,
                          right: 4.h,
                          left: 4.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Vyama rika vya kitume",
                              style: TextStyle(
                                  fontSize: 14.fSize,
                                  color: appTheme.defaultcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("",
                                style: TextStyle(
                                    fontSize: 12.5.fSize,
                                    color: appTheme.defaultcolor,
                                    fontWeight: FontWeight.bold))
                          ],
                        )),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Tuna andaa taarifa za Utoto mtakatifu.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 12.0.fSize);
                            },
                            child: Container(
                                height: 190.v,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.10),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Stack(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/utoto.jpeg"),
                                        fit: BoxFit.cover),
                                    Positioned(
                                      top: null,
                                      left: null,
                                      right: 0.0.h,
                                      bottom: 00.0.v,
                                      child: Container(
                                        height: 50.v,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.7),
                                          border: Border.all(
                                            width: 1.0,
                                            color:
                                                Colors.black.withOpacity(0.10),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "UTOTO MTAKATIFU",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Tuna andaa taarifa za VIWAWA.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 12.0.fSize);
                              ;
                            },
                            child: Container(
                                height: 190.v,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.10),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Stack(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/vijana.jpg"),
                                        fit: BoxFit.cover),
                                    Positioned(
                                      top: null,
                                      left: null,
                                      right: 0.0.h,
                                      bottom: 00.0.v,
                                      child: Container(
                                        height: 50.v,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          border: Border.all(
                                            width: 1.0,
                                            color:
                                                Colors.black.withOpacity(0.10),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "VIWAWA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Tuna andaa taarifa za WAWATA.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 12.0.fSize);
                            },
                            child: Container(
                                height: 190.v,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.10),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Stack(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/wawata.JPG"),
                                        fit: BoxFit.cover),
                                    Positioned(
                                      top: null,
                                      left: null,
                                      right: 0.0.h,
                                      bottom: 00.0.v,
                                      child: Container(
                                        height: 50.v,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          border: Border.all(
                                            width: 1.0,
                                            color:
                                                Colors.black.withOpacity(0.10),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "WAWATA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Tuna andaa taarifa za UWAKA",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  textColor: Colors.white,
                                  fontSize: 12.0.fSize);
                            },
                            child: Container(
                                height: 190.v,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.10),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Stack(
                                  children: [
                                    Image(
                                        image: AssetImage(
                                            "assets/images/uwaka.jpg"),
                                        fit: BoxFit.fitWidth),
                                    Positioned(
                                      top: null,
                                      left: null,
                                      right: 0.0.h,
                                      bottom: 00.0.v,
                                      child: Container(
                                        height: 50.v,
                                        width: 150.h,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          border: Border.all(
                                            width: 1.0,
                                            color:
                                                Colors.black.withOpacity(0.10),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "UWAKA",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.fSize,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ************************************************************************************
            Container(
              height: 242.v,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.v),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 15.v, bottom: 15.v, right: 4.h, left: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Matukio yajayo parokiani",
                              style: TextStyle(
                                  fontSize: 14.fSize,
                                  color: appTheme.defaultcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(Matukio(),
                                    duration: Duration(milliseconds: 500),
                                    transition:
                                        Transition.fadeIn //transition effect
                                    );
                              },
                              child: Text("",
                                  style: TextStyle(
                                      fontSize: 12.5.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),

                    //-------------------------------------------------********************************************************************************************************************************---

                    Obx(
                      () => connections.parokiaMatukioList.isNotEmpty
                          ? Container(
                              child: CarouselSlider(
                                items: <Widget>[
                                  for (var i = 0;
                                      i < connections.parokiaMatukioList.length;
                                      i++)
                                    buildImage(
                                        '${connections.parokiaMatukioList[i].tarehe}',
                                        '${connections.parokiaMatukioList[i].title}',
                                        '${connections.parokiaMatukioList[i].maelezo}',
                                        context),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 16 / 8,
                                  viewportFraction: 1.0,
                                  autoPlay:
                                      true, // Set to true for auto-playing the carousel
                                  autoPlayInterval: Duration(seconds: 30),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 500),
                                  autoPlayCurve: Curves.easeIn,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) {
                                    // Callback when the page changes
                                  },
                                  scrollDirection: Axis
                                      .horizontal, // Set to Axis.vertical for vertical carousel
                                ),
                              ),
                            )
                          : Container(
                              child: CarouselSlider(
                                items: [
                                  buildImage(
                                      '07 - 07 - 2024',
                                      'Sherehe ya Somo wa Parokia',
                                      'Wanaparokia wa K/ndege mnakumbushwa kushiriki kwa Wingi',
                                      context)
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 16 / 8,
                                  viewportFraction: 1.0,
                                  autoPlay:
                                      true, // Set to true for auto-playing the carousel
                                  autoPlayInterval: Duration(seconds: 30),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 500),
                                  autoPlayCurve: Curves.easeIn,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) {
                                    // Callback when the page changes
                                  },
                                  scrollDirection: Axis
                                      .horizontal, // Set to Axis.vertical for vertical carousel
                                ),
                              ),
                            ),
                    )

                    // ---------------------------------------------------
                  ],
                ),
              ),
            ),

            Container(
              height: 280.v,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(right: 6.h, left: 4.h, bottom: 15.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Kndege TV",
                            style: TextStyle(
                                fontSize: 14.fSize,
                                color: appTheme.defaultcolor,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(Tv(),
                                  duration: Duration(milliseconds: 500),
                                  transition:
                                      Transition.fadeIn //transition effect
                                  );
                            },
                            child: Text("",
                                style: TextStyle(
                                    fontSize: 14.fSize,
                                    color: appTheme.defaultcolor,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      )),
                  Expanded(
                    child: Container(
                        height: 210.v,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.10),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: youtubeChannel),
                  ),
                ],
              ),
            ),
          ])),
    );
  }

  fomu_za_huduma(BuildContext context) {
    HomeController formController = Get.put(HomeController());
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
                          "Fomu za huduma",
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
              Obx(
                () => formController.fomuList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount: formController.fomuList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: const Icon(
                                  FontAwesomeIcons.filePdf,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                trailing: formController.progress != null
                                    ? CircularProgressIndicator()
                                    : InkWell(
                                        onTap: () {
                                          Get.back();
                                          downloadfile(
                                              formController
                                                  .fomuList[index].preview
                                                  .toString(),
                                              formController
                                                  .fomuList[index].jina
                                                  .toString());
                                        },
                                        child: Icon(
                                          FontAwesomeIcons.download,
                                          color: appTheme.defaultcolor,
                                          size: 25.fSize,
                                        ),
                                      ),
                                title: Text(
                                  "${formController.fomuList[index].jina}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold),
                                ));
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

  maoni(BuildContext context) {
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
          top: 8,
        ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100.v,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.15),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Maoni yako ni muhimu sana kwa Maendeleo ya Parokia yetu.",
                      style: TextStyle(
                          fontSize: 12.fSize, fontWeight: FontWeight.w500),
                    ),
                    GFButton(
                      textStyle: TextStyle(
                          fontSize: 11.5.fSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      color: appTheme.defaultcolor.withOpacity(0.15),
                      onPressed: () {},
                      text: "Karibu utuandikie",
                      icon: Icon(
                        FontAwesomeIcons.edit,
                        size: 18.fSize,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ratiba(BuildContext context) {
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
        child: Container(
          height: 340.v,
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
                          "Ratiba za Ibada",
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
              Container(
                  width: double.infinity,
                  height: 150.v,
                  child: Obx(
                    () => ratibaController.ratibaList.isEmpty
                        ? DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                Container(
                                  child: TabBar(
                                    padding: EdgeInsets.zero,
                                    indicatorColor: appTheme.defaultcolor,
                                    tabAlignment: TabAlignment.start,
                                    isScrollable: true,
                                    labelColor: appTheme.defaultcolor,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    unselectedLabelColor: Colors.black,
                                    tabs: [
                                      FadeInLeft(
                                        child: Tab(
                                          text: "Jumapili",
                                        ),
                                      ),
                                      FadeInRight(
                                        child: Tab(
                                          text: "Siku za Juma",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 180.v,
                                  child: SlideInUp(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          height: 180.v,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 120.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ibada ya Kwanza",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "12:00 - 12:50  Asubuhi",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 120.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ibada ya Pili",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "1:00 - 2:50  Asubuhi",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 120.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ibada ya  Tatu",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "3:00 - 4:40  Asubuhi",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 120.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ibada ya Nne ( Watoto )",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "5:00 - 6.00  Mchana ",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 180.v,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 100.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Ibada za Hasubuhi",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "12:30- 1:00  Asubuhi",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15.h,
                                                    top: 15.v,
                                                    right: 100.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Alhamis ( Kuabudu Ekarist)",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      "11:00 - 12:30  Jioni",
                                                      style: TextStyle(
                                                          fontSize: 12.fSize,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : BounceInUp(
                            child: GFLoader(
                                size: GFSize.SMALL,
                                loaderstrokeWidth: 2,
                                type: GFLoaderType.ios),
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String tarehe, String title, String maelezo, context) {
    return Container(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: appTheme.defaultcolor.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: 60.v,
              width: 350.h,
              child: Padding(
                padding: EdgeInsets.only(left: 10.h, right: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_month),
                    SizedBox(width: 10.h),
                    Text('${tarehe}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.fSize,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                color: Colors.black.withOpacity(0.09),
                height: 110.v,
                width: 350.h,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0.v),
                  child: Column(
                    children: [
                      Text('${title}',
                          style: TextStyle(
                              color: appTheme.defaultcolor,
                              fontSize: 18.fSize,
                              fontWeight: FontWeight.bold)),
                      Text('${maelezo}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: TextStyle(
                              color: appTheme.defaultcolor,
                              fontSize: 14.fSize,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }

  matangazo_mengine(BuildContext context) {
    HomeController dataController = Get.put(HomeController());
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
                          "Matangazo mengine ya Dominika",
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
              Obx(
                () => dataController.matangazofile.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          //shrinkWrap: true,
                          itemCount: dataController.matangazofile.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                leading: const Icon(
                                  FontAwesomeIcons.filePdf,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                trailing: dataController.progress != null
                                    ? CircularProgressIndicator()
                                    : InkWell(
                                        onTap: () {
                                          Get.back();
                                          downloadfile(
                                              dataController
                                                  .matangazofile[index].file
                                                  .toString(),
                                              dataController
                                                  .matangazofile[index].dominika
                                                  .toString());
                                        },
                                        child: Icon(
                                          FontAwesomeIcons.download,
                                          color: appTheme.defaultcolor,
                                          size: 25.fSize,
                                        ),
                                      ),
                                title: Text(
                                  "${dataController.matangazofile[index].dominika}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold),
                                ));
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
}

// jumuiya(BuildContext context) {}
