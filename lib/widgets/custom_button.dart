import 'package:flutter/material.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? btnColor;
  final Color? textColor;
  final Function onTapFunction;
  final double? borderRadius;

  CustomButton({
    this.btnColor,
    this.textColor,
    this.borderRadius,
    required this.text,
    this.height,
    this.width,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        height: height ?? 55,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        child: Center(
          child: CustomText(
            text: text,
            size: 14,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String text;
  final double? height;
  final Color? btnColor;
  final Color? textColor;
  final Widget btnIcon;
  final Function onTapFunction;

  CustomIconButton({
    this.btnColor,
    this.textColor,
    required this.text,
    this.height,
    required this.btnIcon,
    required this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapFunction();
      },
      child: Container(
          height: height ?? 55,
          color: btnColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnIcon,
              const SizedBox(
                width: 12,
              ),
              CustomText(
                text: text,
                size: 14,
                color: textColor ?? Colors.white,
              ),
            ],
          )),
    );
  }
}
