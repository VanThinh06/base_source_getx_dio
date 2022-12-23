import 'package:bytehr22/base_widget/byte_button.dart';
import 'package:bytehr22/utils/color_resources.dart';
import 'package:bytehr22/utils/image_rource.dart';
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: ColorResources.WHITE,
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              const Text("Byte Hr Mobile"),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Image.asset(ImgResource.LOGO)),
              // Form Login.
              formLogin(),

              // Button login.
              BButton(
                  title: 'Login',
                  onClick: () {
                    controller.signIn();
                  })
            ],
          ),
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
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Login ByteHR",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          TextFormField(
            controller: controller.controllerUser,
            decoration: const InputDecoration(
                hintText: 'User name', prefixIcon: Icon(Icons.person)),
          ),
          Obx(
            () => TextFormField(
              controller: controller.controllerPassword,
              obscureText: controller.isPassword.value,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.key),
                suffixIcon: GestureDetector(
                  onTap: () {
                    controller.isPassword.value = !controller.isPassword.value;
                  },
                  child: Icon(controller.isPassword.value
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined),
                ),
              ),
            ),
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
