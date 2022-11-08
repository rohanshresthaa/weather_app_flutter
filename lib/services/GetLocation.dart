import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Future<void> getCurrentLocation() async {
    try {
      final position = await locationProvider();
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

locationProvider() async {
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("error");
    }
  }
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
