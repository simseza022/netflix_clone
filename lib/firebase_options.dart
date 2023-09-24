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
    apiKey: 'AIzaSyBZudZ_isl3obi2bLf1BJqHAWWlm5oGR6g',
    appId: '1:487295226180:web:e023ec0af87f82d7ed8711',
    messagingSenderId: '487295226180',
    projectId: 'popcorn-flix-e7bbd',
    authDomain: 'popcorn-flix-e7bbd.firebaseapp.com',
    storageBucket: 'popcorn-flix-e7bbd.appspot.com',
    measurementId: 'G-MS570GQTPE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUrfcPUQHTITXY3Os-EHC5loFqNV0DXP0',
    appId: '1:487295226180:android:bd34f9df8df4e233ed8711',
    messagingSenderId: '487295226180',
    projectId: 'popcorn-flix-e7bbd',
    storageBucket: 'popcorn-flix-e7bbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWnwOXYoN3uhfZs6vLOsoRE1mGVykjXNA',
    appId: '1:487295226180:ios:bac4c728aab46d93ed8711',
    messagingSenderId: '487295226180',
    projectId: 'popcorn-flix-e7bbd',
    storageBucket: 'popcorn-flix-e7bbd.appspot.com',
    iosBundleId: 'com.example.popcornFlix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBWnwOXYoN3uhfZs6vLOsoRE1mGVykjXNA',
    appId: '1:487295226180:ios:1e0e348e079b6fcaed8711',
    messagingSenderId: '487295226180',
    projectId: 'popcorn-flix-e7bbd',
    storageBucket: 'popcorn-flix-e7bbd.appspot.com',
    iosBundleId: 'com.example.popcornFlix.RunnerTests',
  );
}