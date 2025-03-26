// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAqMzaJIFE2qyEod4oY2mOC32iNg35Ovoc',
    appId: '1:1092630660262:web:3c9a56efb91078a25c6067',
    messagingSenderId: '1092630660262',
    projectId: 'eatsup-d8b77',
    authDomain: 'eatsup-d8b77.firebaseapp.com',
    databaseURL: 'https://eatsup-d8b77-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'eatsup-d8b77.firebasestorage.app',
    measurementId: 'G-V5Z244QXVC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBM_Uhwt77nUyJh3v-7JK9GFU5DT1kr9HU',
    appId: '1:1092630660262:android:e38e572ffe2e60aa5c6067',
    messagingSenderId: '1092630660262',
    projectId: 'eatsup-d8b77',
    databaseURL: 'https://eatsup-d8b77-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'eatsup-d8b77.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8WVI99iogaZ4RfLNRZNPwU5Qy1e4WNCI',
    appId: '1:1092630660262:ios:bcfd74345875f23c5c6067',
    messagingSenderId: '1092630660262',
    projectId: 'eatsup-d8b77',
    databaseURL: 'https://eatsup-d8b77-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'eatsup-d8b77.firebasestorage.app',
    iosBundleId: 'com.example.eatsup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8WVI99iogaZ4RfLNRZNPwU5Qy1e4WNCI',
    appId: '1:1092630660262:ios:bcfd74345875f23c5c6067',
    messagingSenderId: '1092630660262',
    projectId: 'eatsup-d8b77',
    databaseURL: 'https://eatsup-d8b77-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'eatsup-d8b77.firebasestorage.app',
    iosBundleId: 'com.example.eatsup',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAqMzaJIFE2qyEod4oY2mOC32iNg35Ovoc',
    appId: '1:1092630660262:web:ef4a16f3386dcf1f5c6067',
    messagingSenderId: '1092630660262',
    projectId: 'eatsup-d8b77',
    authDomain: 'eatsup-d8b77.firebaseapp.com',
    databaseURL: 'https://eatsup-d8b77-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'eatsup-d8b77.firebasestorage.app',
    measurementId: 'G-8X6KTV80X6',
  );
}
