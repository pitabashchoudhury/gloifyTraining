import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> currentLocation() async {
  List<Placemark> placemarks;
  Placemark? place;
  try {
    Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    place = placemarks[0];

    return "${place.street},${place.locality}, ${place.postalCode}, ${place.country}";
  } catch (exception) {
    return "error in location fetching";
  }
}
