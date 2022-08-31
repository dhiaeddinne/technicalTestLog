import 'package:technical_test_logient/models/shift.dart';

class OfferedShiftsState {
  OfferedShiftsState();
}

class OfferedShiftsInitialState extends OfferedShiftsState {
  OfferedShiftsInitialState();
}

class OfferedShiftLoadingState extends OfferedShiftsState {
  OfferedShiftLoadingState();
}

class OfferedShiftsLoadedSuccessfully extends OfferedShiftsState {
  Map<String, List<Shift>> shifts;
  OfferedShiftsLoadedSuccessfully({required this.shifts});
}

class FailedToLoadOfferedShifts extends OfferedShiftsState {
  FailedToLoadOfferedShifts();
}
