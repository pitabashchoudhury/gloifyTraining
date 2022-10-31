import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_weather_form/bloc/bloc/detail_bloc.dart';
import 'package:flutter_location_weather_form/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    super.dispose();
    DetailBloc().close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DetailBloc(),
        child: const HomePage(),
      ),
    );
  }
}
