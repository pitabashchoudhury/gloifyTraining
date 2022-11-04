import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<void> currentLocation() async {
  List<Placemark> placemarks;
  Placemark? place;
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    if (position.altitude != null) {
      placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      place = placemarks[0];
    }

    print(place!.locality);
  } catch (Exception) {
    print("error in location fetching");
  }
  // return "${place!.locality}";
}
