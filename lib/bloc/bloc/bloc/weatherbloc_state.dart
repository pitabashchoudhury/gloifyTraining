part of 'weatherbloc_bloc.dart';

class WeatherblocState {
  Weather? weather;

  WeatherblocState({
    this.weather,
  });

  WeatherblocState copyWith({Weather? weather}) {
    return WeatherblocState(
      weather: weather,
    );
  }
}
