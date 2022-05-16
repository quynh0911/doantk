// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWU0O-vCleDTuj5XISJxnABamIPZtdIdc',
    appId: '1:812705679007:android:9053100c770b9ef67f44aa',
    messagingSenderId: '812705679007',
    projectId: 'homeiot-e8f53',
    databaseURL: 'https://homeiot-e8f53-default-rtdb.firebaseio.com',
    storageBucket: 'homeiot-e8f53.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC94CszWSqDiw5pu7LkDzdhZctkr5JMTD4',
    appId: '1:812705679007:ios:008fdc1b8ee5c6d17f44aa',
    messagingSenderId: '812705679007',
    projectId: 'homeiot-e8f53',
    databaseURL: 'https://homeiot-e8f53-default-rtdb.firebaseio.com',
    storageBucket: 'homeiot-e8f53.appspot.com',
    iosClientId: '812705679007-ltnedttf14s0p37qcdp8niqcccsk1e45.apps.googleusercontent.com',
    iosBundleId: 'com.example.doAnTk',
  );
}
