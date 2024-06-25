// ignore_for_file: prefer_const_constructors, unused_import

import 'package:app/core/utils/size_utils.dart';
import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_login.dart';
import 'package:app/kndegetv/tv.dart';
import 'package:app/profile_screen/profile.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String id;

  VideoScreen({required this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  final Tv youtubeChannel = new Tv();

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags:
          YoutubePlayerFlags(mute: false, autoPlay: true, hideControls: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: appTheme.defaultcolor.withOpacity(0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                child: youtubeChannel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
