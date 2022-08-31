import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;
import 'package:technical_test_logient/widgets/tag_widget.dart';

class ShiftCard extends StatelessWidget {
  final String company;
  final String startAt;
  final String status;
  final String endAt;
  final String postName;
  final String buyPrice;
  final String bonusPrice;

  ShiftCard({
    required this.company,
    required this.postName,
    required this.startAt,
    required this.status,
    required this.endAt,
    required this.buyPrice,
    required this.bonusPrice,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat.Hm();
    final DateFormat formatterDate = DateFormat.MMMMEEEEd();

    return Container(
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
            const SizedBox(
              height: 12,
            ),
            CustomText(
              text: status.toUpperCase(),
              color: formatterDate.format(DateTime.now()) ==
                  formatterDate.format(DateTime.parse(startAt.toString()))
                  ? colors.red
                  : colors.grey,
              size: 15,
              weight: FontWeight.w500,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TagWidget(content: postName),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomText(
                      text: "${buyPrice}\$ / H",
                      color: colors.grey,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomText(
                      text: "+ ${bonusPrice}\$ / H",
                      color: colors.green,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                  child: CustomText(
                    text:
                        "${formatter.format(DateTime.parse(startAt))} - ${formatter.format(DateTime.parse(endAt))}",
                    color: colors.red,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
