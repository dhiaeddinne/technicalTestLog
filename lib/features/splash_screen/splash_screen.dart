import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:technical_test_logient/utils/colors.dart' as colors;
import 'package:flutter/material.dart';
import 'package:technical_test_logient/features/offered_shift/offered_shift_screen.dart';
import 'package:technical_test_logient/widgets/custom_navigation/slide_left_route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<Timer> startTimer() async {
    return Timer(const Duration(milliseconds: 2500), onDoneLoading);
  }

  onDoneLoading() {
    Navigator.of(context).pushAndRemoveUntil(
        SlideLeftRoute(page: ShiftOffertScreen()), (_) => false);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.lightGreen,
      body: const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
