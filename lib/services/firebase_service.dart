import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:test_app/firebase_options.dart';

class FirebaseService {

  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await _initRemoteConfig();
    }
    catch (_) {
      rethrow;
    }
  }

  static Future<void> _initRemoteConfig() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    await remoteConfig.fetchAndActivate();
  }

  static Future<void> getVersions() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    final response = remoteConfig.getString('GooglePlay');
  }
}