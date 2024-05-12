// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables
import 'package:app/core/utils/size_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

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
      backgroundColor: Colors.white.withOpacity(0.5),
      body: Stack(
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
                          width: 1000.0,
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
              contents(context)
            ],
          ),
          Positioned(
            height: 100.v,
            width: 100.h,
            top: 200.0.v,
            left: null,
            right: 200.h,
            bottom: null,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                    width: 1.0, color: Color.fromARGB(255, 150, 75, 75)),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Center(
                child: Text(
                  "Tsh 100,000.00",
                  style: TextStyle(
                      color: Color.fromARGB(255, 190, 62, 62),
                      fontWeight: FontWeight.bold,
                      fontSize: 14.fSize),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  contents(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 233, 227, 227),
        height: 24.v,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start, children: [])));
  }
}
