import 'package:do_an_tk/const/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
// import 'package:video_player/video_player.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../firebase_options.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return firebaseApp;
  }
  late MqttClient client;

  @override
  Widget build(BuildContext context) {
    // VideoPlayerController videoPlayerController =
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          centerTitle: true,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Smart building", style: TextStyle(
              fontSize: 20
          ),),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Camera", style: TextStyle(
                    fontSize: 15
                ),),
              ),
              Container(
                height: 300,
                child: const Mjpeg(
                  fit: BoxFit.fill,
                  stream: 'http://192.168.0.115/cam.mjpeg',
                  isLive: true
                ),
                decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OutlinedButton(
                    // borderSide: const BorderSide(color: AppColors.blue, width: 10),
                    style: OutlinedButton.styleFrom(
                      primary: AppColors.blue,
                      side: const BorderSide(width: 2.0, color: AppColors.blue),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                    ),

                    onPressed: () {
                      //mo cua

                      connect().then((value) {
                        client = value;
                      });
                    },
                    child: const Text("Mở cửa", style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 20
                    ),),
                  ),
                ),
              )
            ],
          ),
        ));
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<MqttServerClient> connect() async {
    MqttServerClient client =
    MqttServerClient.withPort('broker.hivemq.com', 'flutter', 1883);
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .authenticateAs('', '')
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;
    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    // client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
    //   print(c);
    //   // final MqttPublishMessage message = c[0].payload;
    //   // final payload =
    //   // MqttPublishPayload.bytesToStringAsString(message.payload.message);
    //
    //   // print('Received message:$payload from topic: ${c[0].topic}>');
    // });
    //
    const pubTopic = 'python/mqtt/pub';
    final builder = MqttClientPayloadBuilder();
    builder.addString('open');
    client.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload!);

    return client;
  }
// connection succeeded
  void onConnected() {
    print('Connected');
  }

// unconnected
  void onDisconnected() {
    print('Disconnected');
  }

// subscribe to topic succeeded
  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

  void _publish(String message) {
    final builder = MqttClientPayloadBuilder();
    builder.addString('open');
    client?.publishMessage('python/mqtt/pub', MqttQos.atLeastOnce, builder.payload!);
  }

// subscribe to topic failed
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

// unsubscribe succeeded
  void onUnsubscribed(String? topic) {
    print('Unsubscribed topic: $topic');
  }

// PING response received
  void pong() {
    print('Ping response client callback invoked');
  }

}
