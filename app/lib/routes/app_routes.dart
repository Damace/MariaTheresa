import 'package:app/home_screen/home_screen.dart';
import 'package:app/kndege/kndege.dart';
import 'package:app/splash_screen/binding/splash_binding.dart';
import 'package:app/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/initialRoute';
  static const String homescreen = '/homescreen';
  static const String kndege = '/kndege';
  static const String wageni = '/wageni';
  static const String tv = '/tv';
  static const String jumuiya = '/jumuiya';
  static const String profile = '/profile';

  static List<GetPage> pages = [
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
