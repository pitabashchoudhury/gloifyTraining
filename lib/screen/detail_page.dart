import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_weather_form/bloc/bloc/detail_bloc.dart';
import 'package:flutter_location_weather_form/repository/current_location.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              child: BlocBuilder<DetailBloc, DetailState>(
                builder: (context, state) {
                  return Text(
                    "${state.name!},${state.movie!},${state.location!}",
                    style: const TextStyle(
                        color: Colors.red,
                        height: 2,
                        wordSpacing: 1.0,
                        fontSize: 20),
                  );
                },
              ),
            ),
            const Text(
              // currentLocation(),
              "bubu",
            ),
          ],
        ),
      ),
    );
  }
}
