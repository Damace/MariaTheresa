// ignore_for_file: prefer_const_constructors, unused_import

import 'package:app/connectivity/connectivityController.dart';
import 'package:app/core/utils/initial_bindings.dart';
import 'package:app/core/utils/logger.dart';
import 'package:app/firebase_options.dart';
import 'package:app/home_screen/home_screen_controller.dart';
import 'package:app/jumuiya/jumuiya_controller.dart';
import 'package:app/notification/notification.dart';
import 'package:app/routes/app_routes.dart';
import 'package:app/theme/theme_helper.dart';
import 'package:app/widgets/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FlutterDownloader.initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });

  ConnectivityController connections = ConnectivityController();
  await connections.hasNetwork();
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

// class CheckUserLoggedInOrNot extends StatefulWidget {
//   const CheckUserLoggedInOrNot({super.key});

//   @override
//   State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
// }

// class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {
//   @override
//   void initState() {
//     AuthService.isLoggedIn().then((value) {
//       if (value) {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePage()));
//       } else {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }
