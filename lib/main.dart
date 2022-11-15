import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final MqttServerClient client =
  //     MqttServerClient('a1q54soguztrms-ats.iot.us-west-2.amazonaws.com', '');
  var client = MqttServerClient(
    't1ce993a.us-east-1.emqx.cloud',
    '',
  );

  String? msg = "not connected";

  @override
  void dispose() {
    super.dispose();
    client.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mqtt',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'MQTT Protocol',
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              width: 300,
              height: 300,
              color: Colors.amberAccent,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  const Text(
                    'WEl COME',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  bodySteam(),
                  TextButton(
                    onPressed: () async {
                      connect();
                    },
                    child: const Text(
                      'connect',
                    ),
                  ),
                  Text(
                    msg!,
                  ),
                  TextButton(
                    onPressed: () async {
                      disconnect();
                    },
                    child: const Text(
                      'Disconnect',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void connect() async {
    //'ws://t1ce993a.us-east-1.emqx.cloud',

    try {
      client.logging(on: false);
      client.keepAlivePeriod = 60;
      client.port = 15600;
      client.onConnected = onConnected;
      client.onDisconnected = onDisconnected;
      client.pongCallback = pong;

      //client.setProtocolV311();
      // final MqttConnectMessage connMess = MqttConnectMessage().startClean();
      // client.connectionMessage = connMess;
      final connMess = MqttConnectMessage()
          .withClientIdentifier('bubu')
          .authenticateAs('pitabashc98', 'pitabashc98')
          .startClean()
          .withWillQos(MqttQos.atLeastOnce);
      print('EXAMPLE::Mosquitto client connecting....');

      client.connectionMessage = connMess;

      try {
        await client.connect();
      } on Exception catch (e) {
        print('EXAMPLE::client exception - $e');
        client.disconnect();
      }
      if (client.connectionStatus!.state == MqttConnectionState.connected) {
        print("Connected to EMQX cloud Successfully!");
      } else {
        print("failed");
      }

      const topic = 'test';
      client.subscribe(topic, MqttQos.atMostOnce);

      // client.updates?.listen((List<MqttReceivedMessage<MqttMessage>>? c) {
      //   final recMess = c![0].payload as MqttPublishMessage;
      //   final message =
      //       MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      //   print(message.toString());
      // });

    } catch (e) {
      print("error");
    }

    // return "bubu";
  }

  void onConnected() {
    setState(() {
      msg = "connected";
    });
  }

  void onDisconnected() {
    setState(() {
      msg = "disconnected";
    });
  }

  void pong() {
    print("ponged");
  }

  void disconnect() {
    client.disconnect();
  }

  Widget bodySteam() {
    return Container(
      color: Colors.white,
      child: StreamBuilder(
        stream: client.updates,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            );
          } else {
            final mqttReceivedMessages =
                snapshot.data as List<MqttReceivedMessage<MqttMessage>>;

            final recMess =
                mqttReceivedMessages[0].payload as MqttPublishMessage;
            final message = MqttPublishPayload.bytesToStringAsString(
                recMess.payload.message);

            return Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                border: Border.all(
                  width: 1.0,
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: (Text(
                  message,
                )),
              ),
            );
          }
        },
      ),
    );
  }
}
