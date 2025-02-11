import 'package:gtrace3/config/imports.dart';

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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6T_jnvXV-tLA5qrJOP4ltTfY1IY9xxUU',
    appId: '1:274920232484:android:43539bce7dad6804e26ab1',
    messagingSenderId: '274920232484',
    projectId: 'gtracebbdd',
    storageBucket: 'gtracebbdd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzRl-kRweMNyi3mS0e3vChSvp5gHJMc1c',
    appId: '1:274920232484:ios:4736d5130d44763de26ab1',
    messagingSenderId: '274920232484',
    projectId: 'gtracebbdd',
    storageBucket: 'gtracebbdd.firebasestorage.app',
    iosBundleId: 'com.example.gtrace3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzRl-kRweMNyi3mS0e3vChSvp5gHJMc1c',
    appId: '1:274920232484:ios:4736d5130d44763de26ab1',
    messagingSenderId: '274920232484',
    projectId: 'gtracebbdd',
    storageBucket: 'gtracebbdd.firebasestorage.app',
    iosBundleId: 'com.example.gtrace3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC44oqzTwT_D7m9hXj_sxix_vPdCc1oQ1Q',
    appId: '1:274920232484:web:920ac9458d87cb27e26ab1',
    messagingSenderId: '274920232484',
    projectId: 'gtracebbdd',
    authDomain: 'gtracebbdd.firebaseapp.com',
    storageBucket: 'gtracebbdd.firebasestorage.app',
  );

}