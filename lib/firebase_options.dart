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
    apiKey: 'AIzaSyDzn8VgEDZsmX4jsRoSn0txAb1GwmDQpgE',
    appId: '1:824555574148:web:13688974374f120f8b03d1',
    messagingSenderId: '824555574148',
    projectId: 'notification-project-d3707',
    authDomain: 'notification-project-d3707.firebaseapp.com',
    storageBucket: 'notification-project-d3707.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkLahd-TR3xkiq9stjYmfHSnQNgHFSLxs',
    appId: '1:824555574148:android:3a62c375e8bb7a8d8b03d1',
    messagingSenderId: '824555574148',
    projectId: 'notification-project-d3707',
    storageBucket: 'notification-project-d3707.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcTTnRnaCiN32BeoPSuEAPt22ISunp3bk',
    appId: '1:824555574148:ios:56d7186a5758f1858b03d1',
    messagingSenderId: '824555574148',
    projectId: 'notification-project-d3707',
    storageBucket: 'notification-project-d3707.appspot.com',
    iosBundleId: 'com.example.notificationProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcTTnRnaCiN32BeoPSuEAPt22ISunp3bk',
    appId: '1:824555574148:ios:81b76645cbbade578b03d1',
    messagingSenderId: '824555574148',
    projectId: 'notification-project-d3707',
    storageBucket: 'notification-project-d3707.appspot.com',
    iosBundleId: 'com.example.notificationProject.RunnerTests',
  );
}
