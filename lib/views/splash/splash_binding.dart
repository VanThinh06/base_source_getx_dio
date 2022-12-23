import 'package:bytehr22/views/home/home_controller.dart';
import 'package:bytehr22/views/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}