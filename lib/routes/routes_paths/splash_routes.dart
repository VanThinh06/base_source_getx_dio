// ignore_for_file: constant_identifier_names

import 'package:bytehr22/views/auth/login/login_binding.dart';
import 'package:bytehr22/views/auth/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashRoutes {
  static const String LOGIN_PAGE = '/login';

  static List<GetPage> list = [
    GetPage(
      name: LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
