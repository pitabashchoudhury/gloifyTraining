import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_weather_form/bloc/bloc/bloc/weatherbloc_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String> currentLocation(BuildContext context) async {
  List<Placemark> placemarks;
  Placemark? place;
  try {
    Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    place = placemarks[0];
    // ignore: use_build_context_synchronously
    context.read<WeatherblocBloc>().add(
          WeatherEvent(place: place.locality),
        );

    return "${place.street},${place.locality}, ${place.postalCode}, ${place.country}";
  } catch (exception) {
    return "error in location fetching";
  }
}
