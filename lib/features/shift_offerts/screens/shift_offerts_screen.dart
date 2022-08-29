import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:technical_test_logient/widgets/card_widget.dart';
import 'package:technical_test_logient/widgets/custom_text.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;

class ShiftOffertScreen extends StatefulWidget {

  @override
  _ShiftOffertScreenState createState() => _ShiftOffertScreenState();
}

class _ShiftOffertScreenState extends State<ShiftOffertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ShiftCard(
              company:  "Bristo Sous le Fort",
              status: "Aujourd'hui",
              postName:  "Serveur",
              bonusPrice: 2.toString(),
              buyPrice: 10.toString(),
              startAt: "2022-03-05 22:00:00"  ,
              endAt: "2022-03-06 02:00:00",
            ),
            const SizedBox(height: 15,),
            ShiftCard(
              company:  "Bristo Sous le Fort",
              status: "Aujourd'hui",
              postName:  "Serveur",
              bonusPrice: 2.toString(),
              buyPrice: 10.toString(),
              startAt: "2022-03-05 22:00:00"  ,
              endAt: "2022-03-06 02:00:00",
            ),
          ],
        ),
      ),
    );
  }
}
