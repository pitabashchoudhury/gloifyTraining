import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInfo(
    String? wind, String? humidity, String? pressure, String? feelsLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Wind",
                  style: titleFont,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Pressure",
                  style: titleFont,
                ),
              ],
            ),

            //bubu
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  wind!,
                  style: infoFont,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  pressure!,
                  style: infoFont,
                ),
              ],
            ),
            // bubu
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Humidity",
                  style: titleFont,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Feels Like",
                  style: titleFont,
                ),
              ],
            ),
            //bubu
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  humidity!,
                  style: infoFont,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  feelsLike!,
                  style: infoFont,
                ),
              ],
            ),
            // bubu
          ],
        ),
      ],
    ),
  );
}
