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
   apiKey: "AIzaSyBHj0LYCNPNnv2oTv6sb-j8SGR3LbiIJB4",
  authDomain: "news-app-b18b9.firebaseapp.com",
  databaseURL: "https://news-app-b18b9.firebaseio.com",
  projectId: "news-app-b18b9",
  storageBucket: "news-app-b18b9.appspot.com",
  messagingSenderId: "961617701989",
  appId: "1:961617701989:web:76ca4931c37aa3f4b26a8c"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAh48NWm4skGInMAWvb2bVy9qbZJJ-8yWg',
    appId: '1:961617701989:android:6c4480ba67b87a68b26a8c',
    messagingSenderId: '961617701989',
    projectId: 'news-app-b18b9',
    storageBucket: 'news-app-b18b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMP7y8zbzv-ZaIAzh8wXgS50xPD5oT09U',
    appId: '1:961617701989:ios:75bef4243b39cebdb26a8c',
    messagingSenderId: '961617701989',
    projectId: 'news-app-b18b9',
    storageBucket: 'news-app-b18b9.appspot.com',
    iosBundleId: 'com.example.routingexample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMP7y8zbzv-ZaIAzh8wXgS50xPD5oT09U',
    appId: '1:961617701989:ios:8dd55343b5cb7ecfb26a8c',
    messagingSenderId: '961617701989',
    projectId: 'news-app-b18b9',
    storageBucket: 'news-app-b18b9.appspot.com',
    iosBundleId: 'com.example.routingexample.RunnerTests',
  );
}
