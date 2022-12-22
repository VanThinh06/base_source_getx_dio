import 'package:bytehr22/base_widget/byte_button.dart';
import 'package:bytehr22/utils/color_resources.dart';
import 'package:bytehr22/views/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  final LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            const Text("Byte Hr Mobile"),

            // Form Login.
            formLogin(),

            // Button login.
            BButton(title: 'Login', onClick: () {})
          ],
        ),
      ),
    );
  }

  ///
  /// Form login.
  ///
  Widget formLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          TextFormField(
            controller: controller.controllerUser,
            decoration: const InputDecoration(
                hintText: 'User name', prefixIcon: Icon(Icons.person)),
          ),
          TextFormField(
            controller: controller.controllerPassword,
            decoration: const InputDecoration(
                hintText: 'Password', prefixIcon: Icon(Icons.password)),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isCheckBox.value,
                  checkColor: ColorResources.WHITE,
                  activeColor: ColorResources.PRIMARY,
                  onChanged: (value) {
                    controller.isCheckBox.value = value!;
                  },
                ),
              ),
              const Text('Remember account')
            ],
          ),
        ],
      ),
    );
  }
}
