
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_logient/domain/repositories/reverse_geocoding_repository.dart';
import 'package:technical_test_logient/features/shift_details/bloc/reverse_geocoding_events.dart';
import 'package:technical_test_logient/features/shift_details/bloc/reverse_geocoding_states.dart';

class ReverseGeoCodingBloc extends Bloc<ReverseGeocodingEvents, ReverseGeocodingStates> {
  final ReverseGeocodingRepositories _reverseGeocodingRepositories = ReverseGeocodingRepositories();

  ReverseGeoCodingBloc() : super(ReverseGeocodingInitialState()) {
    on<ReverseLatLong>((event, emit) async {
      emit(LoadingState());
      try {
        final result = await _reverseGeocodingRepositories.getAddressFromLat(latitude: event.lat, longitude: event.long);
        emit(AddressLoadedSuccessfully(address: result));
      } catch (e2) {
        emit(AddressLoadedSuccessfully(address: "address Not Found"));
      }
    });
  }
}
