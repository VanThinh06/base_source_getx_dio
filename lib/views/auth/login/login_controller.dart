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
  late RxBool isCheckBox;

  // is obscure password
  RxBool isPassword = true.obs;

  // request login
  LoginRequest _loginRequest = LoginRequest();

  // auth
  AuthRepository authRepository = GetIt.I.get<AuthRepository>();

  //
  var prefAccount = getIt<PrefsHelper>();

  @override
  void onInit() {
    isCheckBox = prefAccount.getRemember.obs;
    getAccount();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.delete<LoginController>();
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
        rememberAccount();
        getAccount();
      },
      onError: (error) {
        print("error error1 $error");
        setEmtyAccount();
      },
    );
  }

  ///
  /// remember account
  ///
  void rememberAccount() {
    if (isCheckBox.isTrue) {
      prefAccount.setRemember(status: isCheckBox.value);
      prefAccount.setUser(user: controllerUser.text);
      prefAccount.setPassword(password: controllerPassword.text);
    } else {
      setEmtyAccount();
    }
  }

  ///
  /// Emty account
  ///
  void setEmtyAccount() {
    prefAccount.setRemember(status: false);
    prefAccount.setUser(user: "");
    prefAccount.setPassword(password: "");
  }

  ///
  /// Get account
  ///
  void getAccount() {
    if (prefAccount.getRemember) {
      isCheckBox.isTrue;
      controllerUser.text = prefAccount.getUser;
      controllerPassword.text = prefAccount.getPassword;
    } else {
      print("abc2");
      isCheckBox.isFalse;
      prefAccount.setRemember(status: isCheckBox.isFalse);
      controllerUser.text = "";
      controllerPassword.text = "";
    }
  }
}
