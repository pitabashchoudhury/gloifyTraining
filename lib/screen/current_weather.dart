import 'package:flutter/material.dart';

Widget currentWeather(String icon, String? temp, String? location) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Icon(
        //   icon,
        //   color: Colors.orange,
        //   size: 64.0,
        // ),
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
            "http://openweathermap.org/img/w/$icon.png",
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          temp!,
          style: const TextStyle(fontSize: 46.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          location!,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF5a5a5a),
          ),
        ),
      ],
    ),
  );
}
