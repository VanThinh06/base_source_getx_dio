import 'package:bytehr22/base_widget/byte_button.dart';
import 'package:bytehr22/utils/color_resources.dart';
import 'package:bytehr22/utils/image_rource.dart';
import 'package:bytehr22/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

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
              const Text("Home ByteHR "),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Image.asset(ImgResource.LOGO)),
              // Form Login.
              // formLogin(),

              // Button login.
              BButton(
                  title: 'Logout',
                  onClick: () {
                    controller.logout();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
