import 'package:flutter/material.dart';

Widget currentWeather(String icon, String? temp, String? location) {
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 60,
          width: 60,
          child: Image.network(
            "http://openweathermap.org/img/w/$icon.png",
            height: 60,
            width: 60,
            fit: BoxFit.contain,
          ),
        ),
        Column(
          children: [
            Text(
              temp!,
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              location!,
              style: const TextStyle(
                fontSize: 12.0,
                color: Color(0xFF5a5a5a),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
