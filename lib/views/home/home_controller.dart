import 'package:bytehr22/di/service_locator.dart';
import 'package:bytehr22/routes/routes_paths/splash_routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> logout() async {
    Get.offAndToNamed(SplashRoutes.LOGIN_PAGE);
    // await getIt.reset(dispose: false);
  }
}
