import 'package:app/home_screen/home_screen.dart';
import 'package:app/jumuiya/jumuiya_home.dart';
import 'package:app/kndege/kndege.dart';
import 'package:app/notification/notification.dart';
import 'package:app/otp_screen/OTP.dart';
import 'package:app/otp_screen/form_otp_screen.dart';
import 'package:app/otp_screen/otp_screen.dart';
import 'package:app/otp_screen/phone_screen.dart';
import 'package:app/splash_screen/binding/splash_binding.dart';
import 'package:app/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:app/profile_screen/profile.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/initialRoute';
  static const String homescreen = '/homescreen';
  static const String kndege = '/kndege';
  static const String wageni = '/wageni';
  static const String tv = '/tv';
  static const String jumuiya = '/jumuiya';
  static const String profile = '/profile';
  static const String otp = '/otp';
  static const String notification = '/notification';
  static const String phonenumber = '/phonenumber';
  static const String jumuiya_home = '/jumuiya_home';
  static const String otp_screen = '/jumuiya_home';
  static const String form_otp_screen = '/form_otp_screen';

  static List<GetPage> pages = [

   GetPage(
      name: profile,
      page: () =>  Profile(),
    ),

    GetPage(
      name: form_otp_screen,
      page: () => FormOtpScreen(),
    ),
    GetPage(
      name: otp_screen,
      page: () => Otp_screen(),
    ),
    GetPage(
      name: jumuiya_home,
      page: () => Jumuiya_home(),
    ),
    GetPage(
      name: notification,
      page: () => Notification_screen(),
    ),
    GetPage(
      name: phonenumber,
      page: () => PhoneNumber(),
    ),
    GetPage(
      name: otp,
      page: () => Otp(),
    ),
    GetPage(
      name: profile,
      page: () => Home(),
    ),
    GetPage(
      name: jumuiya,
      page: () => Home(),
    ),
    GetPage(
      name: tv,
      page: () => Home(),
    ),
    GetPage(
      name: kndege,
      page: () => Home(),
    ),
    GetPage(
      name: homescreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
