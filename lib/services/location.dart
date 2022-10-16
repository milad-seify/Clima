import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    //LocationPermission permission = await Geolocator.checkPermission();
    // LocationPermission permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
