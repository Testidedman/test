import 'package:firebase_core/firebase_core.dart';
import 'package:test_app/firebase_options.dart';

class FirebaseService {

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    catch (_) {
      rethrow;
    }
  }
}