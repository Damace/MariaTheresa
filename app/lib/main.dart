// ignore_for_file: prefer_const_constructors

import 'package:app/core/utils/initial_bindings.dart';
import 'package:app/core/utils/logger.dart';
import 'package:app/notification/notification.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/widgets/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OneSignal.initialize(KappId);
    OneSignal.Notifications.addClickListener((event) {
      Get.to(Notification_screen());
    });
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarBrightness: Brightness.light,
    //   statusBarIconBrightness: Brightness.light,
    // ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      //translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'kndege',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
