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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCgAEk5iS9Uv05ijkAsooyn322ccZhq9jI',
    appId: '1:876821601873:web:dd7584224860ffde8ea270',
    messagingSenderId: '876821601873',
    projectId: 'toeic-c58a4',
    authDomain: 'toeic-c58a4.firebaseapp.com',
    storageBucket: 'toeic-c58a4.appspot.com',
    measurementId: 'G-D42Q8BLX9L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyWLCiDme2kAiA92qI1XG9wsRJ3IziCKo',
    appId: '1:876821601873:android:9f33180bce0ce4808ea270',
    messagingSenderId: '876821601873',
    projectId: 'toeic-c58a4',
    storageBucket: 'toeic-c58a4.appspot.com',
  );
}