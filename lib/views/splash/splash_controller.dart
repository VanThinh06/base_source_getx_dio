import 'package:bytehr22/di/service_locator.dart';
import 'package:bytehr22/routes/routes_paths/splash_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:bytehr22/data/local/shared_preferences/prefs_helper.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
    );
    _controller!.forward().whenComplete(() {
      if (getIt<PrefsHelper>().getRemember) {
        Get.offAndToNamed(SplashRoutes.HOME_PAGE);
      } else {
        Get.offAndToNamed(SplashRoutes.LOGIN_PAGE);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
