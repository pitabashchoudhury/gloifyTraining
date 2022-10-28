import 'dart:convert';
import 'package:flutter_location_weather_form/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherClient {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=d573765183db0165f60901b27988b520');
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    return Weather.fromJson(body);
  }
}
