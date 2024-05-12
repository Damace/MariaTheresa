import 'package:app/home_screen/home_screen.dart';
import 'package:app/splash_screen/binding/splash_binding.dart';
import 'package:app/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String initialRoute = '/initialRoute';
  static const String homescreen = '/homescreen';

  static List<GetPage> pages = [
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
