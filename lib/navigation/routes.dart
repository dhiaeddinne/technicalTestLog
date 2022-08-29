import 'package:flutter/material.dart';
import 'package:technical_test_logient/features/shift_details/screens/shift_details_screen.dart';
import 'package:technical_test_logient/features/shift_offerts/screens/shift_offerts_screen.dart';
import 'package:technical_test_logient/features/splash_screen/splash_screen.dart';


const String splashRoute = "/";
const String shiftOffertRoute = "/shiftsOffertsScreen";
const String shiftDetailsRoute = "/shiftDetailsScreen";

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
    case shiftDetailsRoute:
      return MaterialPageRoute(
        builder: (context) => ShiftDetailsScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => ShiftOffertScreen(),
      );
  }
}
