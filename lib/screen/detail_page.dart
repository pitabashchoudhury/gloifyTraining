import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_weather_form/bloc/bloc/bloc/weatherbloc_bloc.dart';
import 'package:flutter_location_weather_form/bloc/bloc/detail_bloc.dart';
// import 'package:flutter_location_weather_form/bloc/bloc/detail_bloc.dart';
// import 'package:flutter_location_weather_form/model/weather_model.dart';
// import 'package:flutter_location_weather_form/repository/current_weather.dart';
import 'package:flutter_location_weather_form/widgets/userdetail_card.dart';

import '../widgets/additional_info.dart';
import '../widgets/current_weather.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? place;
  late Timer _clockTimer;
  @override
  void initState() {
    super.initState();

    _clockTimer = Timer.periodic(const Duration(minutes: 15), ((timer) {
      context.read<WeatherblocBloc>().add(
            WeatherEvent(place: place),
          );
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _clockTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              // SizedBox(
              //   child: BlocBuilder<DetailBloc, DetailState>(
              //     builder: (context, state) {
              //       return Text(
              //         state.location!,
              //         style: const TextStyle(
              //             color: Colors.red,
              //             height: 2,
              //             wordSpacing: 1.0,
              //             fontSize: 20),
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<WeatherblocBloc, WeatherblocState>(
                builder: (context, state) {
                  place = state.weather?.name;
                  return Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Container(
                        height: height * 0.22,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(
                            1.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.0,
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white30,
                            border: Border.all(
                              color: Colors.black54,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              currentWeather(
                                "${state.weather?.weather![0].icon}",
                                "${state.weather!.main!.temp?.toStringAsFixed(2)} °C",
                                "${state.weather?.name},${state.weather?.sys?.country}",
                              ),
                              additionalInfo(
                                state.weather?.wind?.speed.toString(),
                                state.weather?.main?.humidity.toString(),
                                state.weather?.main?.pressure.toString(),
                                state.weather?.main?.feelsLike.toString(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        left: (width * 0.9) / 2.5,
                        child: Container(
                          height: 20,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(
                            //   color: Colors.black,
                            //   width: 1.0,
                            // ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Weather Detail',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     context.read<WeatherblocBloc>().add(
              //           WeatherEvent(place: place),
              //         );
              //   },
              //   child: const Text(
              //     "ok",
              //   ),
              // ),

              BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  return userInfo(
                    width * 0.9,
                    'https://picsum.photos/id/71/367/267',
                    state.name!,
                    state.email!,
                    state.movie!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
