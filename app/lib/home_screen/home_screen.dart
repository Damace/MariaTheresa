import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/fx/fx.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/matangazo/matangazo.dart';
import 'package:app/matukio/matukio.dart';
import 'package:app/notification/notification.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/michango/michango_screen.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/wageni/wageni_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:marquee/marquee.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  RatibaController matangazoController = Get.put(RatibaController());
  final formkey = GlobalKey<FormState>();

  final nv = new Fx();
  late String dropdown;

  final List<String> imageList = [
    "assets/images/jesuit.png",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  List list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  bool vsb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 99, 32, 32).withOpacity(0.93),
        backgroundColor: Colors.white.withOpacity(0.93),
        body: Container(
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
                                color: appTheme.defaultcolor.withOpacity(0.15),
                                onPressed: () {
                                  ratiba(context, matangazoController);
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
                                color: appTheme.defaultcolor.withOpacity(0.15),
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
                      maoni(context);
                    },
                    child: Icon(
                      Icons.mail,
                      color: appTheme.defaultcolor.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 35.h,
                left: null,
                right: 7.h,
                bottom: null,
                child: InkWell(
                  onTap: () {
                    Get.to(Notification_screen(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.fadeIn //transition effect
                        );
                  },
                  child: Badge(
                    label: Text("0"),
                    child: Icon(
                      Icons.notifications_on_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
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
                          PopupMenuItem(
                              child: Row(
                            children: [
                              Icon(Icons.tv, size: 23.fSize),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Kndege TV"),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: [
                              Icon(Icons.mail_outlined, size: 23.fSize),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Toa Maoni"),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: [
                              Icon(Icons.call, size: 23.fSize),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Mawasiliano"),
                              )
                            ],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: [
                              Icon(Icons.church_outlined, size: 23.fSize),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text("Historia ya Parokia"),
                              )
                            ],
                          ))
                        ],
                      ))),
              Positioned(
                top: 98.h,
                left: 7.0,
                right: null,
                bottom: null,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                      Text("Parokia ya Mwenyeheri Maria Theresa Ledochwosker",
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
                  var dropdownValue = "Select";
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
                      child: Container(
                        height: 650.v,
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
                              padding: EdgeInsets.only(
                                  top: 20.v, right: 8.h, left: 8.h),
                              child: Container(
                                height: 40.v,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        appTheme.defaultcolor.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.peopleGroup,
                                        size: 14.fSize,
                                      ),
                                      SizedBox(
                                        width: 10.h,
                                      ),
                                      Text(
                                        "Kwa matumizi ya jumuiya tu.",
                                        style: TextStyle(
                                            fontSize: 12.5.fSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GFSearchBar(
                              searchList: list,
                              searchQueryBuilder: (query, list) {
                                return list
                                    .where((item) => item
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
                                    .toList();
                              },
                              overlaySearchListItemBuilder: (item) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 14.fSize),
                                  ),
                                );
                              },
                              onItemSelected: (item) {
                                setState(() {
                                  //print('$item');

                                  vsb = true;
                                });
                              },
                            ),
                            Container(
                              color: appTheme.defaultcolor,
                              height: 12.v,
                              padding: const EdgeInsets.all(8),
                            ),
                            GFButton(
                              textStyle: TextStyle(
                                  fontSize: 11.5.fSize,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              color: appTheme.defaultcolor.withOpacity(0.15),
                              onPressed: () {
                                Get.to(Wageni(),
                                    duration: Duration(milliseconds: 500),
                                    transition:
                                        Transition.fadeIn //transition effect
                                    );
                              },
                              text: "Log in",
                              icon: Icon(
                                FontAwesomeIcons.listUl,
                                size: 18.fSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                          fontSize: 12.5.fSize,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Matangazo(),
                            duration: Duration(milliseconds: 500),
                            transition: Transition.fadeIn //transition effect
                            );
                      },
                      child: Text("More",
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                        child: Image(
                                      image: AssetImage(
                                          "assets/images/sadaka.png"),
                                      fit: BoxFit.cover,
                                    )),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Center(
                                          child: Image(
                                        image: AssetImage(
                                            "assets/images/ndoa.png"),
                                        fit: BoxFit.cover,
                                      )),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/usafi.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/kitume.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/sadaka.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                  Text(
                                    "Michango",
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jumuiya.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                  Container(
                                    width: 50.h,
                                    height: 50.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jumuiya.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border:
                                            Border.all(color: Colors.black)),
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
                                        text:
                                            'Viongozi wa jumuiya Zote Mnatakiwa kuchukua Bahasha za Mavumo!',
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
                                        Get.to(Matangazo(),
                                            duration:
                                                Duration(milliseconds: 500),
                                            transition: Transition
                                                .fadeIn //transition effect
                                            );
                                      },
                                      child: Text(
                                        "Zaidi",
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
                              "Vyama vya Kitume",
                              style: TextStyle(
                                  fontSize: 12.5.fSize,
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
                          Container(
                              height: 190.v,
                              width: 150.h,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Stack(
                                children: [
                                  // Image(
                                  //     image: AssetImage(
                                  //         "assets/images/utoto.jpeg"),
                                  //     fit: BoxFit.cover),
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
                                          color: Colors.black.withOpacity(0.10),
                                        ),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Jumuiya",
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
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
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
                                          color: Colors.black.withOpacity(0.10),
                                        ),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Utoto Mtakatifu",
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
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
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
                                          color: Colors.black.withOpacity(0.10),
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
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
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
                                          color: Colors.black.withOpacity(0.10),
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
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
                              height: 190.v,
                              width: 150.h,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Stack(
                                children: [
                                  Image(
                                      image:
                                          AssetImage("assets/images/uwaka.jpg"),
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
                                          color: Colors.black.withOpacity(0.10),
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
              height: 280.v,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.v),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 10.v, bottom: 10.v, right: 4.h, left: 4.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Taarifa na Matukio ya Parokia",
                              style: TextStyle(
                                  fontSize: 12.5.fSize,
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
                              child: Text("More",
                                  style: TextStyle(
                                      fontSize: 12.5.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),

                    //----------------------------------------------------

                    Container(
                      child: CarouselSlider(
                        items: [
                          // buildImage('https://example.com/image1.jpg'),
                          //buildImage('https://example.com/image2.jpg'),
                          //buildImage('https://example.com/image3.jpg'),

                          buildImage('assets/images/jesuit.png',
                              'Look for Best Seller ?', context),
                          buildImage('assets/images/utoto.jpeg',
                              'Need Connection ?', context),
                          buildImage('assets/images/jesuit.png',
                              'Look for Marke ?', context),

                          // Your carousel items go here (e.g., Image.network, Container, etc.)
                          // Image.network('https://example.com/image1.jpg'),
                          //Image.network('https://example.com/image2.jpg'),
                          //Image.network('https://example.com/image3.jpg'),
                        ],
                        options: CarouselOptions(
                          aspectRatio: 16 / 8,
                          viewportFraction: 1.0,
                          autoPlay:
                              true, // Set to true for auto-playing the carousel
                          autoPlayInterval: Duration(seconds: 30),
                          autoPlayAnimationDuration: Duration(milliseconds: 50),
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

                    // ---------------------------------------------------
                  ],
                ),
              ),
            ),

            Container(
              height: 200.v,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.v),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            right: 4.h, left: 4.h, bottom: 10.v, top: 10.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Videos and Other Media",
                              style: TextStyle(
                                  fontSize: 12.5.fSize,
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
                              child: Text("More",
                                  style: TextStyle(
                                      fontSize: 12.5.fSize,
                                      color: appTheme.defaultcolor,
                                      fontWeight: FontWeight.bold)),
                            )
                          ],
                        )),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                              height: 190.v,
                              width: 150.h,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Image(
                                  image: AssetImage("assets/images/utoto.jpeg"),
                                  fit: BoxFit.cover)),
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
                              height: 190.v,
                              width: 150.h,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: Image(
                                  image: AssetImage("assets/images/vijana.jpg"),
                                  fit: BoxFit.cover)),
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
                            height: 190.v,
                            width: 150.h,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.10),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Image(
                                image: AssetImage("assets/images/wawata.JPG"),
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          Container(
                            height: 190.v,
                            width: 150.h,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.10),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Image(
                                image: AssetImage("assets/images/uwaka.jpg"),
                                fit: BoxFit.fitWidth),
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

            Text("")
          ])),
    );
  }
}

// jumuiya(BuildContext context) {}

fomu_za_huduma(BuildContext context) {
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
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 4.h, right: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.fSize,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "Fomu ya Ubatizo",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 200.h,
                    ),
                    Icon(
                      FontAwesomeIcons.download,
                      color: appTheme.defaultcolor,
                      size: 25.fSize,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 4.h, right: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.fSize,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "Fomu ya Mazishi",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 200.h,
                    ),
                    Icon(
                      FontAwesomeIcons.download,
                      color: appTheme.defaultcolor,
                      size: 25.fSize,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 4.h, right: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.fSize,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "Fomu ya Kuomba kinanda",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 155.h,
                    ),
                    Icon(
                      FontAwesomeIcons.download,
                      color: appTheme.defaultcolor,
                      size: 25.fSize,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 4.h, right: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.fSize,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "Fomu ya Ubatizo",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 200.h,
                    ),
                    Icon(
                      FontAwesomeIcons.download,
                      color: appTheme.defaultcolor,
                      size: 25.fSize,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Card(
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 5, left: 4.h, right: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 12.fSize,
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "Fomu ya Ubatizo",
                      style: TextStyle(
                        fontSize: 12.fSize,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 200.h,
                    ),
                    Icon(
                      FontAwesomeIcons.download,
                      color: appTheme.defaultcolor,
                      size: 25.fSize,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
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
                    onPressed: () {
                      // ratiba(context);
                    },
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

ratiba(BuildContext context, matangazoController) {
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
                  () => matangazoController.ratiba_za_ibada.isNotEmpty
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

Widget buildImage(String imageUrl, String service, context) {
  return Container(
    height: 12.v, // Set padding to 0
    child: ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(0)), // Set border radius to 0
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(15),
              topStart: Radius.circular(15),
              bottomEnd: Radius.circular(15),
              bottomStart: Radius.circular(15),
            ),

            // --------------------------------------------------------------------------------------------------------------------------

            side: BorderSide(color: appTheme.defaultcolor)),
        elevation: 8,
        child: Container(
            height: 10.v,
            width: 350.h,
            child: Image(image: AssetImage(imageUrl), fit: BoxFit.cover)),
      ),
    ),
  );
}
