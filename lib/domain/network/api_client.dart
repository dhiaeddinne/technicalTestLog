import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:technical_test_logient/utils/app_consts.dart';

class ApiClient {
  Future getOfferedShifts() async {
    final String response = await rootBundle.loadString(baseUrl);
    final data = await json.decode(response);
    return data["data"];
  }
}
