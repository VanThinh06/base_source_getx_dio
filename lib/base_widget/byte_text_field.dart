import 'package:bytehr22/utils/color_resources.dart';
import 'package:flutter/material.dart';

class ByteTextFiled extends StatefulWidget {
  const ByteTextFiled({
    super.key,
    this.obscure = false,
    this.controller,
    this.contentPadding,
    this.radiusFocused,
    this.radiusEnabled,
    this.sideFocused,
    this.sideEnabled,
    this.hintText,
    this.iconPrefix,
  });

  final bool obscure;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final BorderRadius? radiusFocused;
  final BorderRadius? radiusEnabled;
  final BorderSide? sideFocused;
  final BorderSide? sideEnabled;
  final String? hintText;
  final IconData? iconPrefix;

  @override
  State<ByteTextFiled> createState() => _ByteTextFiledState();
}

FocusNode focusNode = FocusNode();

@override
class _ByteTextFiledState extends State<ByteTextFiled> {
  void initState() {
    // TODO: implement initState
    focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      obscureText: widget.obscure,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 1),
        focusedBorder: OutlineInputBorder(
            borderRadius: widget.radiusFocused ?? BorderRadius.circular(10.0),
            borderSide: widget.sideFocused ??
                const BorderSide(color: ColorResources.PRIMARY, width: 1.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: widget.sideEnabled ??
              const BorderSide(
                color: ColorResources.SECOND_TEXT,
                width: 1.0,
              ),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(25.0)),
        //   borderSide: BorderSide(
        //     color: ColorResources.SECOND_TEXT,
        //   ),
        // ),
        prefixIconColor: focusNode.hasFocus ? ColorResources.PRIMARY : null,
        hintText: widget.hintText,
        prefixIcon: widget.iconPrefix == null
            ? Icon(
                widget.iconPrefix,
                color: ColorResources.RED,
              )
            : Icon(widget.iconPrefix),
      ),
    );
  }
}
