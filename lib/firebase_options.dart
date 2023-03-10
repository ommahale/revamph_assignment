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
    apiKey: 'AIzaSyD0aBIA8t8_eq353P4DRba-jysmcUOunKA',
    appId: '1:125808118918:web:de8cf480b6f00f852a9507',
    messagingSenderId: '125808118918',
    projectId: 'revamph-app',
    authDomain: 'revamph-app.firebaseapp.com',
    storageBucket: 'revamph-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmL-gLttXrqfxoa-vroFn5Rc2cOmFhc2w',
    appId: '1:125808118918:android:c8f31ea1549170e92a9507',
    messagingSenderId: '125808118918',
    projectId: 'revamph-app',
    storageBucket: 'revamph-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAasDJva1oIjPml4EdDLBjUsAIPDc4pFW4',
    appId: '1:125808118918:ios:81c4e7fca7dbd3b92a9507',
    messagingSenderId: '125808118918',
    projectId: 'revamph-app',
    storageBucket: 'revamph-app.appspot.com',
    iosClientId: '125808118918-6ngh3cbkuhn3vujrm8qkdfdfecd084bj.apps.googleusercontent.com',
    iosBundleId: 'com.example.revamph',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAasDJva1oIjPml4EdDLBjUsAIPDc4pFW4',
    appId: '1:125808118918:ios:81c4e7fca7dbd3b92a9507',
    messagingSenderId: '125808118918',
    projectId: 'revamph-app',
    storageBucket: 'revamph-app.appspot.com',
    iosClientId: '125808118918-6ngh3cbkuhn3vujrm8qkdfdfecd084bj.apps.googleusercontent.com',
    iosBundleId: 'com.example.revamph',
  );
}
