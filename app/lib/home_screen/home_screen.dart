// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:animate_do/animate_do.dart';
import 'package:app/core/utils/size_utils.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:marquee/marquee.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

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
                            Text("Ratiba za Ibada",
                                style: TextStyle(
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.bold)),
                            GFButton(
                              textStyle: TextStyle(fontSize: 11.fSize),
                              color: appTheme.defaultcolor.withOpacity(0.4),
                              onPressed: () {},
                              text: "Download",
                              icon: Icon(Icons.list_outlined),
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
                            Text("Chukua form",
                                style: TextStyle(
                                    fontSize: 12.fSize,
                                    fontWeight: FontWeight.bold)),
                            GFButton(
                              textStyle: TextStyle(fontSize: 11.fSize),
                              color: appTheme.defaultcolor.withOpacity(0.4),
                              onPressed: () {},
                              text: "Download",
                              icon: Icon(Icons.list_outlined),
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
                child: Icon(Icons.mail),
              ),
            ),
            Positioned(
              top: 35.h,
              left: null,
              right: 7.h,
              bottom: null,
              child: Badge(
                label: Text("0"),
                child: Icon(
                  Icons.notifications_on_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Positioned(
              top: 35.h,
              left: 7.0,
              right: null,
              bottom: null,
              child: Icon(
                Icons.sort,
                color: Colors.white,
                size: 32,
                fill: 0.6,
              ),
            ),
            Positioned(
              top: 98.h,
              left: 7.0,
              right: null,
              bottom: null,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                      border:
                          Border.all(color: Color.fromARGB(255, 190, 148, 9))),
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
                // Container(
                //   width: 40.h,
                //   height: 40.v,
                //   child: Center(
                //     child: Image(
                //       image: AssetImage("assets/images/jesuit.png"),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.white.withOpacity(0.9),
                //       border:
                //           Border.all(color: Color.fromARGB(255, 190, 148, 9))),
                // ),
              ]),
            ),
          ],
        ),
      ),
    );
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
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("More",
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 14.fSize,
                            fontWeight: FontWeight.bold))
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
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                                    "Sadaka",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5.h),
                          FadeInLeft(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                                    "Ndoa",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5.h),
                          FadeOutDownBig(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                          SizedBox(width: 5.h),
                          FadeOutDownBig(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                                    "Zaka",
                                    style: TextStyle(
                                        fontSize: 11.5.fSize,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5.h),
                          FadeOutDownBig(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                          SizedBox(width: 5.h),
                          FadeOutDownBig(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    width: 60.h,
                                    height: 60.v,
                                    child: Center(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/jesuit.png"),
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
                                    "Mengine",
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
                                    child: Text(
                                      "Zaidi",
                                      style: TextStyle(fontSize: 12.fSize),
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
                                  fontSize: 14.fSize,
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("More",
                                style: TextStyle(
                                    fontSize: 14.fSize,
                                    color: Colors.black.withOpacity(0.4),
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
                              "Parish News and Events",
                              style: TextStyle(
                                  fontSize: 14.fSize,
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("More",
                                style: TextStyle(
                                    fontSize: 14.fSize,
                                    color: Colors.black.withOpacity(0.4),
                                    fontWeight: FontWeight.bold))
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
                          buildImage('assets/images/jesuit.png',
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
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
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
                                  fontSize: 14.fSize,
                                  color: Colors.black.withOpacity(0.4),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text("More",
                                style: TextStyle(
                                    fontSize: 14.fSize,
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
            child: Image(
                image: AssetImage("assets/images/utoto.jpeg"),
                fit: BoxFit.cover)),
      ),
    ),
  );
}
