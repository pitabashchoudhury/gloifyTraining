import 'package:flutter/material.dart';
import 'package:flutter_location_weather_form/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Location',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
