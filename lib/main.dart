import 'package:flutter/material.dart';
import 'package:flutter_location_weather_form/cubit/detail_cubit.dart';
import 'package:flutter_location_weather_form/screen/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DetailCubit(),
        child: const MainPage(),
      ),
    );
  }
}
