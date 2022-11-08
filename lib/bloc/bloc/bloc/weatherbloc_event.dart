part of 'weatherbloc_bloc.dart';

abstract class WeatherblocEvent {
  const WeatherblocEvent();
}

class WeatherEvent extends WeatherblocEvent {
  String? place;
  WeatherEvent({this.place});
}
