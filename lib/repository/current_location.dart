import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> currentLocation() async {
  List<Placemark> placemarks;
  Placemark? place;
  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) async {
    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    place = placemarks[0];
  });

  // setState(() {
  //   _currentAddress =
  //       "${place.street},${place.locality}, ${place.postalCode}, ${place.country}";
  // });
  print(place?.locality);
  return "${place!.locality}";
}
