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
    apiKey: 'AIzaSyCuogywj9lL3IJZfrXU0CurNNd3dyX5Zik',
    appId: '1:331369450114:web:84193e4c205ff672fcc29b',
    messagingSenderId: '331369450114',
    projectId: 'lifelink-4fd65',
    authDomain: 'lifelink-4fd65.firebaseapp.com',
    storageBucket: 'lifelink-4fd65.appspot.com',
    measurementId: 'G-7F4J1TX77G',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkP6nHIcaTBdVU_GybSK41wpJ8I1lmD3k',
    appId: '1:331369450114:android:237b60f7804e223bfcc29b',
    messagingSenderId: '331369450114',
    projectId: 'lifelink-4fd65',
    storageBucket: 'lifelink-4fd65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2hzS9RuZiEnt3_rcvDWlEiy5qL0StgG8',
    appId: '1:331369450114:ios:0860ac853ad88037fcc29b',
    messagingSenderId: '331369450114',
    projectId: 'lifelink-4fd65',
    storageBucket: 'lifelink-4fd65.appspot.com',
    iosClientId: '331369450114-bg7qp5e050l6gsk0tpg8dfpv68489j3c.apps.googleusercontent.com',
    iosBundleId: 'com.example.lifelink',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2hzS9RuZiEnt3_rcvDWlEiy5qL0StgG8',
    appId: '1:331369450114:ios:0860ac853ad88037fcc29b',
    messagingSenderId: '331369450114',
    projectId: 'lifelink-4fd65',
    storageBucket: 'lifelink-4fd65.appspot.com',
    iosClientId: '331369450114-bg7qp5e050l6gsk0tpg8dfpv68489j3c.apps.googleusercontent.com',
    iosBundleId: 'com.example.lifelink',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCuogywj9lL3IJZfrXU0CurNNd3dyX5Zik',
    appId: '1:331369450114:web:84193e4c205ff672fcc29b',
    messagingSenderId: '331369450114',
    projectId: 'lifelink-4fd65',
    authDomain: 'lifelink-4fd65.firebaseapp.com',
    storageBucket: 'lifelink-4fd65.appspot.com',
    measurementId: 'G-7F4J1TX77G',
  );

}