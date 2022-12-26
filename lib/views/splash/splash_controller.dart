import 'package:bytehr22/di/service_locator.dart';
import 'package:bytehr22/routes/routes_paths/splash_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:bytehr22/data/local/shared_preferences/prefs_helper.dart';
import 'package:get/get.dart';
import '/di/service_locator.dart' as di;

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _controller.forward().whenComplete(() {
      {
        Get.offAndToNamed(SplashRoutes.LOGIN_PAGE);
      }
    });

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
    }
  }
}
