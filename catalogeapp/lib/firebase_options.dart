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
    apiKey: 'AIzaSyDTMHKUI4nxERY8-oxEK13CrXRZdXd2cuk',
    appId: '1:840881813339:web:30b3eb523c053f69eb8c7e',
    messagingSenderId: '840881813339',
    projectId: 'see-it-82c78',
    authDomain: 'see-it-82c78.firebaseapp.com',
    storageBucket: 'see-it-82c78.appspot.com',
    measurementId: 'G-1QKSYHM859',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzG5Ih70_wVt6WsNmtvZY2xFsg4CgBgfQ',
    appId: '1:840881813339:android:ce1387eb2237a4ceeb8c7e',
    messagingSenderId: '840881813339',
    projectId: 'see-it-82c78',
    storageBucket: 'see-it-82c78.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjz7V0nD2CbuYWv_OZsLrUXfn1CF9y_-c',
    appId: '1:840881813339:ios:184cf80ed8046e80eb8c7e',
    messagingSenderId: '840881813339',
    projectId: 'see-it-82c78',
    storageBucket: 'see-it-82c78.appspot.com',
    iosClientId: '840881813339-0tg30hq5mf0fti4c29otf1tlv00el9n9.apps.googleusercontent.com',
    iosBundleId: 'com.example.catalogeapp',
  );
}
