import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:technical_test_logient/domain/network/api_client.dart';
import 'package:technical_test_logient/models/shift.dart';

class OfferedShiftsRepositories {
  final ApiClient _apiClient = ApiClient();
  final DateFormat formatterDate = DateFormat.MMMMEEEEd();

  Future<Map<String, List<Shift>>> getAllOfferedShifts() async {
    try {
      final result = await _apiClient.getOfferedShifts();
      List<Shift> shifts =
          List<Shift>.from(result.map((model) => Shift.fromJson(model)));
      List<Shift> dailyShift = shifts.where((shift) => formatterDate.format(DateTime.now()) ==
          formatterDate.format(DateTime.parse(shift.startAt.toString()))).toList();
      List<Shift> upcomingShifts = shifts.where((shift) => formatterDate.format(DateTime.now()) !=
          formatterDate.format(DateTime.parse(shift.startAt.toString()))).toList();
      return {
        'DERNIERE MINUTE': dailyShift,
        'SHIFTS A VENIR': upcomingShifts,
      };
    } catch (e) {
      rethrow;
    }
  }
}
