import 'package:flutter/material.dart';
import 'package:technical_test_logient/features/shift_details/shift_details_screen.dart';
import 'package:technical_test_logient/features/splash_screen/splash_screen.dart';

import '../features/offered_shift/offered_shift_screen.dart';


const String splashRoute = "/";
const String shiftOffertRoute = "/shiftsOffertsScreen";

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashRoute:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
    case shiftOffertRoute:
      return MaterialPageRoute(
        builder: (context) => ShiftOffertScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => ShiftOffertScreen(),
      );
  }
}
