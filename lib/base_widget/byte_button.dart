import 'package:bytehr22/utils/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BButton extends StatelessWidget {
  const BButton(
      {super.key,
      this.colorBackground,
      required this.title,
      this.padding,
      this.margin,
      required this.onClick,
      this.textStyle,
      this.radius});

  final Color? colorBackground;
  final TextStyle? textStyle;
  final String title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Function() onClick;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: padding ?? const EdgeInsets.all(15),
        margin: margin ?? const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colorBackground ?? ColorResources.PRIMARY,
            borderRadius: BorderRadius.circular(radius ?? 10)),
        width: Get.width,
        child: Text(
          title,
          style: textStyle ??
              const TextStyle(
                color: ColorResources.WHITE,
                fontSize: 20,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
