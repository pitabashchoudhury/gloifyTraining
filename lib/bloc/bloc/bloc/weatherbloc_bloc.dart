import 'package:bloc/bloc.dart';
import 'package:flutter_location_weather_form/model/weather_model.dart';
import 'package:flutter_location_weather_form/repository/current_weather.dart';
part 'weatherbloc_event.dart';
part 'weatherbloc_state.dart';

class WeatherblocBloc extends Bloc<WeatherblocEvent, WeatherblocState> {
  WeatherblocBloc()
      : super(WeatherblocState(weather: Weather(main: Main(pressure: 2)))) {
    on<WeatherEvent>((event, emit) async {
      Weather? weather = await WeatherClient().getCurrentWeather("bhubaneswar");
      emit(
        state.copyWith(
          weather: weather,
        ),
      );
    });
  }
}
