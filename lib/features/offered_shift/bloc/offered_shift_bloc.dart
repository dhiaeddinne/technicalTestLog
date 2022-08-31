import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_logient/domain/repositories/offered_shifts_repository.dart';
import 'package:technical_test_logient/features/offered_shift/bloc/offered_shift_events.dart';
import 'package:technical_test_logient/features/offered_shift/bloc/offered_shift_states.dart';

class OfferedShiftsBloc extends Bloc<OfferedShiftEvent, OfferedShiftsState> {
  final OfferedShiftsRepositories _offeredShiftsRepositories =
      OfferedShiftsRepositories();

  // OfferedShiftsBloc() : super(OfferedShiftsInitialState());

  OfferedShiftsBloc() : super(OfferedShiftsInitialState()) {
    on<LoadOfferedShift>((event, emit) async {
      emit(OfferedShiftLoadingState());
      try {
        final result = await _offeredShiftsRepositories.getAllOfferedShifts();

        /// fake timing to see the loading animation
        await Future.delayed(Duration(seconds: 1)).whenComplete(
            () => emit(OfferedShiftsLoadedSuccessfully(shifts: result)));
      } catch (e2) {
        emit(FailedToLoadOfferedShifts());
      }
    });
  }
}
