import 'package:bytehr22/base_widget/byte_button.dart';
import 'package:bytehr22/base_widget/byte_text_field.dart';
import 'package:bytehr22/utils/color_resources.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bytehr22/utils/image_rource.dart';
import 'package:bytehr22/utils/text_style.dart';
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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            color: ColorResources.WHITE,
            child: Column(
              children: [
                // logo
                logoLogin(context),

                // Form Login.
                formLogin(),

                // Button login.
                buttonLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///
  Widget logoLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: MediaQuery.of(context).size.width / 2.5,
            child: Image.asset(ImgResource.LOGO)),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Đăng nhập vào tài khoản",
          style: textStyleSpan,
        ),
      ],
    );
  }

  ///
  ///
  ///
  Widget buttonLogin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BButton(
            title: 'Đăng nhập',
            onClick: () {
              controller.signIn();
            }),
      ],
    );
  }

  ///
  /// Form login.
  ///
  Widget formLogin() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          TextFormField(
            controller: controller.controllerUser,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 1),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      BorderSide(color: ColorResources.PRIMARY, width: 1.0)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                  color: ColorResources.SECOND_TEXT,
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(
                  color: ColorResources.SECOND_TEXT,
                ),
              ),
              hintText: 'Tên đăng nhập',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.controllerPassword,
              obscureText: controller.isPassword.value,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:
                        BorderSide(color: ColorResources.PRIMARY, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: ColorResources.SECOND_TEXT,
                    width: 1.0,
                  ),
                ),
                hintText: 'Mật khẩu',
                prefixIcon: Icon(Icons.key, color: ColorResources.PRIMARY),
                prefixIconColor: ColorResources.PRIMARY,
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
              const Text(
                'Lưu mật khẩu',
              )
            ],
          ),
        ],
      ),
    );
  }
}
