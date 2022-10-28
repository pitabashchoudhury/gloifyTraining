import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_location_weather_form/widgets/textfield_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.cyanAccent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          centerTitle: true,
          title: const Text(
            'Bloc Concept',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add Details',
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
                      width: width * 0.9,
                      height: height * 0.9,
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
                            controller: nameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shadowColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {},
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
