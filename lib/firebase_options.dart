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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCfa15V1O-47NucZ2_iOSRR6fIkqWf5vek',
    appId: '1:330953963942:web:746faf0eb99d7d95063767',
    messagingSenderId: '330953963942',
    projectId: 'restaurante-9443d',
    authDomain: 'restaurante-9443d.firebaseapp.com',
    storageBucket: 'restaurante-9443d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCg4HM3JNGYkI43QcolgBxhbUbwy1ziFC4',
    appId: '1:330953963942:android:baff37584f11bfb5063767',
    messagingSenderId: '330953963942',
    projectId: 'restaurante-9443d',
    storageBucket: 'restaurante-9443d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDD1bJZLM0gwogLb_mgnmdw15md50yQgPU',
    appId: '1:330953963942:ios:49708e33f9abf626063767',
    messagingSenderId: '330953963942',
    projectId: 'restaurante-9443d',
    storageBucket: 'restaurante-9443d.firebasestorage.app',
    iosBundleId: 'com.example.restaurants',
  );
}