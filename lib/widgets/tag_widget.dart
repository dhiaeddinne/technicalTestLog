import 'package:flutter/material.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;

class TagWidget extends StatelessWidget {
  final String content;
  final Color? color;

  TagWidget({required this.content,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: colors.lightGrey),
      child: CustomText(
        text: content,
        color: color?? colors.grey,
        size: 14,
        weight: FontWeight.w500,
      ),
    );
  }
}
