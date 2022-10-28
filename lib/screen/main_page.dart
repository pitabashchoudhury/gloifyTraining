import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/model/weather_model.dart';
import 'package:flutter_weatherapp/screen/additional_detail.dart';
import 'package:flutter_weatherapp/screen/current_weather.dart';
import 'package:flutter_weatherapp/services/weather_api_client.dart';

import 'widget/search_delegate.dart';
import '../data/weather.dart' as weather;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget appBarTitle = const Text("Weather App");

  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle,
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                weather.a = await showSearch(
                    context: context, delegate: CustomSearchDeligate());
                if (weather.a?.name != "") {
                  setState(() {
                    loaded = true;
                  });
                }
                // print(data!.name);
              },
            ),
          ],
        ),
        body: Center(
          child: Visibility(
            visible: loaded,
            replacement: const Center(child: Text("Choose your city")),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                currentWeather(
                    "${weather.a!.weather?[0].icon}",
                    "${weather.a!.main.temp.toStringAsFixed(2)} °C",
                    "${weather.a?.name},${weather.a?.sys?.country}"),
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 20.0,
                ),
                additionalInfo(
                    weather.a?.wind?.speed.toString(),
                    weather.a?.main.humidity.toString(),
                    weather.a?.main.pressure.toString(),
                    weather.a?.main.feelsLike.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
