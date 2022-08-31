class ReverseGeocodingEvents {}

class ReverseLatLong extends ReverseGeocodingEvents {
  double lat;
  double long;

  ReverseLatLong({required this.lat, required this.long});
}
