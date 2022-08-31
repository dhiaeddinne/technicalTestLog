import 'package:geocoding/geocoding.dart';

class ReverseGeocodingRepositories {

  Future<String> getAddressFromLat({required double latitude,required double longitude}) async {
    try {
      List<Placemark> address = await placemarkFromCoordinates(latitude, longitude);
      return "${address[0].street}, ${address[0].administrativeArea}";
    } catch (e) {
      rethrow;
    }
  }
}
