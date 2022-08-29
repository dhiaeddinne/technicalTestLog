import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final String? font;
  final TextDecoration? textDecoration;

  CustomText(
      {this.weight,
        this.color,
        this.size,
        this.font,
        required this.text,
        this.textAlign,
        this.letterSpacing,
        this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size ?? 16,
          fontWeight: weight ?? FontWeight.normal,
          color: color ?? Colors.black,
          fontFamily: font,
          decoration: textDecoration,
          letterSpacing: letterSpacing ?? 0),
    );
  }
}
