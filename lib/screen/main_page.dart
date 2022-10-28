import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_location_weather_form/cubit/detail_cubit.dart';
import 'package:flutter_location_weather_form/service/weather_api_client.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../data/weather.dart' as weather;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  String? _currentAddress = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool loaded = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      //  print(position);
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    // print(_currentPosition!);
    try {
      List<Placemark> placemarks =
          // await placemarkFromCoordinates(52.2165157, 6.9437819);
          await placemarkFromCoordinates(
              _currentPosition!.latitude, _currentPosition!.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.street},${place.locality}, ${place.postalCode}, ${place.country}";
      });

      weather.a = await WeatherClient().getCurrentWeather(place.locality);
      if (weather.a?.name != "") {
        setState(() {
          loaded = true;
        });
      }
    } catch (e) {
      print("bubu exception");
    }
  }

  @override
  Widget build(BuildContext context) {
    final heightH = MediaQuery.of(context).size.height;
    final widthW = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Wel Come To Registration App',
          ),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: heightH,
            width: widthW,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add Detail',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                      decorationThickness: 3.0,
                      decorationColor: Colors.redAccent,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: SizedBox(
                      width: widthW * 0.9,
                      height: heightH,
                      //color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          textFieldDesign(
                            controller: nameController,
                            label: 'Name',
                            hint: 'Enter Name...',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFieldDesign(
                            label: 'Email',
                            hint: 'Enter Your Email...',
                            controller: emailController,
                          ),
                          // bubu
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(
                                              Icons.location_on,
                                            ),
                                            onPressed: () async {
                                              LocationPermission permission;
                                              permission = await Geolocator
                                                  .checkPermission();

                                              if (permission ==
                                                  LocationPermission.denied) {
                                                permission = await Geolocator
                                                    .requestPermission();
                                              } else if (permission ==
                                                  LocationPermission
                                                      .whileInUse) {
                                                _getCurrentLocation();
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'User Denied',
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Location',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption,
                                                ),
                                                if (_currentPosition != null &&
                                                    _currentAddress != null)
                                                  Text(_currentAddress!,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                          //bubu
                          Visibility(
                            visible: loaded,
                            replacement: const Center(
                              child: CircularProgressIndicator(),
                            ),
                            child: Text(
                                "${weather.a!.main.temp.toStringAsFixed(2)} °C"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shadowColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              BlocProvider.of<DetailCubit>(context).addDetail(
                                nameController.text,
                                emailController.text,
                                _currentAddress!,
                              );
                              print(
                                  "${nameController.text},${emailController.text},${_currentAddress!}");
                            },
                            child: const Text('Insert'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget textFieldDesign({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Colors.red[500], fontSize: 20),
      contentPadding: const EdgeInsets.all(20),
      hintText: hint,
      labelText: label,
      filled: true,
      hoverColor: Colors.blue.shade100,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue.shade800,
          width: 2.0,
        ),
      ),
    ),
  );
}
