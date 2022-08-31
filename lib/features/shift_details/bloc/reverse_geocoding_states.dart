class ReverseGeocodingStates {
  ReverseGeocodingStates();
}

class ReverseGeocodingInitialState extends ReverseGeocodingStates {
  ReverseGeocodingInitialState();
}

class LoadingState extends ReverseGeocodingStates {
  LoadingState();
}

class AddressLoadedSuccessfully extends ReverseGeocodingStates {
  String address;
  AddressLoadedSuccessfully({required this.address});
}

