import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/model/weather_model.dart';

import '../../services/weather_api_client.dart';

class CustomSearchDeligate extends SearchDelegate<Weather> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // throw UnimplementedError();
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(
          context,
          Weather(
            main: Main(
              temp: 0,
              feelsLike: 0,
              pressure: 0,
              humidity: 0,
            ),
            name: "",
            wind: Wind(speed: 0),
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query != '') {
      return FutureBuilder(
        future: WeatherClient().getCurrentWeather(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Weather? data = snapshot.data;
            return ListTile(
              title: Text(data!.name),
              subtitle: Text(data.timezone.toString()),
              onTap: () {
                close(context, data);
              },
              // leading: ,
            );
          } else {
            return Container();
          }
        },
      );
    } else {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Enter City Name...'),
      );
    }
  }
}
