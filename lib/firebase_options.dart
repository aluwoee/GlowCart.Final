import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
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
    apiKey: 'AIzaSyCJckaFjiuV_T3ZUpyJhXtmpVlkQPxiFvw',
    appId: '1:325245278382:web:6920a9e9a22426d5c2753f',
    messagingSenderId: '325245278382',
    projectId: 'final-1ecf3',
    authDomain: 'final-1ecf3.firebaseapp.com',
    storageBucket: 'final-1ecf3.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6jRcirz6Up2klFrwzyzsyxvZtKWWxGBg',
    appId: '1:325245278382:android:d88e0a376f315b4ec2753f',
    messagingSenderId: '325245278382',
    projectId: 'final-1ecf3',
    storageBucket: 'final-1ecf3.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCJckaFjiuV_T3ZUpyJhXtmpVlkQPxiFvw',
    appId: '1:325245278382:web:86a5e1daeac7efbcc2753f',
    messagingSenderId: '325245278382',
    projectId: 'final-1ecf3',
    authDomain: 'final-1ecf3.firebaseapp.com',
    storageBucket: 'final-1ecf3.firebasestorage.app',
  );
}
