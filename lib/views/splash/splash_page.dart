import 'package:bytehr22/utils/color_resources.dart';
import 'package:bytehr22/utils/dimesion_size.dart';
import 'package:bytehr22/utils/image_rource.dart';
import 'package:bytehr22/utils/text_style.dart';
import 'package:bytehr22/views/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  final SplashController controller = Get.put(SplashController());

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          alignment: Alignment.center,
          height: DimesionSize.HEIGHT_SCREEN,
          color: ColorResources.WHITE,
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: MediaQuery.of(context).size.width / 3,
                  child: Image.asset(ImgResource.LOGO)),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Byte HR",
                style: textStyleH6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
