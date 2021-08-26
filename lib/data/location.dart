import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationNotifier with ChangeNotifier {
  var location = "Alexandria";

  set locations(value) {
    location = value;
    notifyListeners();
  }

  get locations => location;

  void locationNow() async {
    List<Placemark> placemark;
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    if (position != null)
      placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);
    locations = placemark[0].subAdministrativeArea;
  }
}
