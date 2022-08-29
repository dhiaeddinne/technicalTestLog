import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;


class ShiftCard extends StatelessWidget {
  final String company;
  final String startAt;
  final String status;
  final String endAt;
  final String postName;
  final String buyPrice;
  final String bonusPrice;

  ShiftCard(
      {required this.company,
        required this.postName,
        required this.startAt,
        required this.status,
        required this.endAt,
        required this.buyPrice,
        required this.bonusPrice,});


  @override
  Widget build(BuildContext context) {

    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat.Hm();
    final String formatted = formatter.format(now);

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 20.0, // soften the shadow
            spreadRadius: 0.0, //extend the shadow
            offset: const Offset(
              5.0, // Move to right 10  horizontally
              5.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: company,
              weight: FontWeight.w500,
              size: 20,
            ),
            const SizedBox(height: 12,),
            CustomText(
              text: status.toUpperCase(),
              color: colors.red,
              size: 15,
              weight: FontWeight.w500,
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(11, 10, 11, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: colors.lightGrey
                      ),
                      child:   CustomText(
                        text: postName,
                        color: colors.grey,
                        size: 14,
                        weight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    CustomText(
                      text: "${buyPrice}\$ / H",
                      color: colors.grey,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(width: 12,),
                    CustomText(
                      text: "+ ${bonusPrice}\$ / H",
                      color: colors.green,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                CustomText(
                  text: "${formatter.format(DateTime.parse(startAt))} - ${formatter.format(DateTime.parse(endAt))}",
                  color: colors.red,
                  size: 14,
                  weight: FontWeight.w500,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
