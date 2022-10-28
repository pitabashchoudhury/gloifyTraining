import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_location_weather_form/widgets/textfield_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _chosenValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
            // height: height,
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
                      //height: height * 0.9,
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
                          const SizedBox(
                            height: 20,
                          ),
                          // dropdown
                          Container(
                            width: width,
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton<String>(
                              menuMaxHeight: 250,
                              borderRadius: BorderRadius.circular(10),
                              underline: Container(),
                              icon: const Icon(
                                Icons.arrow_downward_outlined,
                              ),
                              iconEnabledColor: Colors.grey,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              elevation: 0,
                              value: _chosenValue,
                              items: <String>[
                                'Thriller Movies',
                                'Drama Movies',
                                'Comedy Movies',
                                'Horor Movies',
                                'Crime Movies',
                                'Documentary Movies',
                                'Multiplex movies',
                              ].map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: const Text(
                                "Choose your movie type..",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _chosenValue = value;
                                });
                              },
                            ),
                          ),
                          //dropdown
                          const SizedBox(
                            height: 20,
                          ),
                          // location Lane
                          Container(
                            width: width,
                            height: height * 0.7 / 10,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: <Widget>[
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Tap on  icon to fetch current location",
                                    ),
                                  ),
                                ),
                                IconButton(
                                  alignment: Alignment.topRight,
                                  highlightColor: Colors.red,
                                  tooltip: "Tap",
                                  splashRadius: 10.0,
                                  icon: const Icon(
                                    Icons.location_on,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          // location Lane
                          const SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            width: width,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shadowColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(_chosenValue!),
                                  ),
                                );
                              },
                              child: const Text('Insert'),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.greenAccent,
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.red,
                              ),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'content',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: width / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'See Details',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
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
