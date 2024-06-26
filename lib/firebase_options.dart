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
    apiKey: 'AIzaSyDIME-8JmTOmwJ0mUuszFDaek2Kycpp2dA',
    appId: '1:843214619101:web:4cfbed1d09493ad27cb634',
    messagingSenderId: '843214619101',
    projectId: 'fir-test-application-4cc44',
    authDomain: 'fir-test-application-4cc44.firebaseapp.com',
    storageBucket: 'fir-test-application-4cc44.appspot.com',
    measurementId: 'G-GMV1KXL56T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0uxmrojhma-f-CU5ZqZao3_Tk_UaUTjM',
    appId: '1:843214619101:android:f53051772e89c1437cb634',
    messagingSenderId: '843214619101',
    projectId: 'fir-test-application-4cc44',
    storageBucket: 'fir-test-application-4cc44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0HkbNLGpDQxElmohlRxYr6nvs8YIE6VA',
    appId: '1:843214619101:ios:5848ac2f1b8dcc397cb634',
    messagingSenderId: '843214619101',
    projectId: 'fir-test-application-4cc44',
    storageBucket: 'fir-test-application-4cc44.appspot.com',
    iosBundleId: 'com.example.applicationWithFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0HkbNLGpDQxElmohlRxYr6nvs8YIE6VA',
    appId: '1:843214619101:ios:5848ac2f1b8dcc397cb634',
    messagingSenderId: '843214619101',
    projectId: 'fir-test-application-4cc44',
    storageBucket: 'fir-test-application-4cc44.appspot.com',
    iosBundleId: 'com.example.applicationWithFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIME-8JmTOmwJ0mUuszFDaek2Kycpp2dA',
    appId: '1:843214619101:web:50562fbb40e216737cb634',
    messagingSenderId: '843214619101',
    projectId: 'fir-test-application-4cc44',
    authDomain: 'fir-test-application-4cc44.firebaseapp.com',
    storageBucket: 'fir-test-application-4cc44.appspot.com',
    measurementId: 'G-KEL6CFG12K',
  );
}
