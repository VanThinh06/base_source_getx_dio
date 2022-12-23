// ignore_for_file: constant_identifier_names

import 'package:bytehr22/views/home/home_binding.dart';
import 'package:bytehr22/views/home/home_page.dart';
import 'package:bytehr22/views/auth/login/login_binding.dart';
import 'package:bytehr22/views/auth/login/login_page.dart';
import 'package:bytehr22/views/splash/splash_binding.dart';
import 'package:bytehr22/views/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashRoutes {
  static const String LOGIN_PAGE = '/login';
  static const String HOME_PAGE = '/home';
  static const String SPLASH = '/splash';

  static List<GetPage> list = [
    GetPage(
      name: SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
