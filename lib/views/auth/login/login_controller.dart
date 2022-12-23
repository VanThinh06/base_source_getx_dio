import 'package:bytehr22/data/local/shared_preferences/prefs_helper.dart';
import 'package:bytehr22/data/models/auth/login_request.dart';
import 'package:bytehr22/data/repository/auth_repository.dart';
import 'package:bytehr22/di/service_locator.dart';
import 'package:bytehr22/routes/routes_paths/splash_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class LoginController extends GetxController {
  /// controller form login
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  // is checkbox true or false
  RxBool isCheckBox = false.obs;

  // is obscure password
  RxBool isPassword = true.obs;

  // request login
  LoginRequest _loginRequest = LoginRequest();

  // auth
  AuthRepository authRepository = GetIt.I.get<AuthRepository>();

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

  void signIn() {
    //request
    _loginRequest = LoginRequest()
      ..username = controllerUser.text
      ..password = controllerPassword.text
      ..clientId = 'BYTECRUNCHTESTDB'
      ..timezone = DateTime.now().timeZoneOffset.inHours;

    // call login
    authRepository.signin(
      loginRequest: _loginRequest,
      onSuccess: (auth) {
        Get.offAndToNamed(SplashRoutes.HOME_PAGE);
        getIt<PrefsHelper>().setRemember(status: isCheckBox.value);
      },
      onError: (error) {},
    );
  }
}
