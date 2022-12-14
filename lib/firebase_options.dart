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
    apiKey: 'AIzaSyCOhId0UXqTAhyT1mlodzmAzAmVNm3Ik5Q',
    appId: '1:1033594137931:web:25534945e4bdb81db24cce',
    messagingSenderId: '1033594137931',
    projectId: 'pocketcheff-firebase',
    authDomain: 'pocketcheff-firebase.firebaseapp.com',
    storageBucket: 'pocketcheff-firebase.appspot.com',
    measurementId: 'G-X2W4NRCJPN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-Fyf1E5ZbXRisRBsFjuxPpCBM4ruoD0Y',
    appId: '1:1033594137931:android:19ab6c040a021650b24cce',
    messagingSenderId: '1033594137931',
    projectId: 'pocketcheff-firebase',
    storageBucket: 'pocketcheff-firebase.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6198Y_2oL4nFqDo1twlwySbo_m7GXcuA',
    appId: '1:1033594137931:ios:a106059a8c5e8a20b24cce',
    messagingSenderId: '1033594137931',
    projectId: 'pocketcheff-firebase',
    storageBucket: 'pocketcheff-firebase.appspot.com',
    iosClientId: '1033594137931-s96ml5r2suf8qk90apukftosv9g8mlr2.apps.googleusercontent.com',
    iosBundleId: 'com.example.pockectcheff',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC6198Y_2oL4nFqDo1twlwySbo_m7GXcuA',
    appId: '1:1033594137931:ios:a106059a8c5e8a20b24cce',
    messagingSenderId: '1033594137931',
    projectId: 'pocketcheff-firebase',
    storageBucket: 'pocketcheff-firebase.appspot.com',
    iosClientId: '1033594137931-s96ml5r2suf8qk90apukftosv9g8mlr2.apps.googleusercontent.com',
    iosBundleId: 'com.example.pockectcheff',
  );
}
