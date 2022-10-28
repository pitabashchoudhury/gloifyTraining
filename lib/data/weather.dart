library data.weather;

import 'package:flutter_weatherapp/model/weather_model.dart';

Weather? a = Weather(
  main: Main(
    temp: 0,
    feelsLike: 0,
    pressure: 0,
    humidity: 0,
  ),
  name: "",
  wind: Wind(speed: 0),
);
