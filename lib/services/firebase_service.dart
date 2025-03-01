import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/models/version_model.dart';

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

  static Future<AppStatus> getAppStatus() async {
    try {
      final List<VersionModel> versionModels = _getVersions();
      final String currentVersion = await _getCurrentVersion();
      final VersionModel currentVersionModel = versionModels.firstWhere(
              (versionModel) => currentVersion == versionModel.version
      );
      return currentVersionModel.appStatus;
    }
    catch (_) {
      return AppStatus.technicalWorks;
    }
  }

  static List<VersionModel> _getVersions() {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      final response = remoteConfig.getString('GooglePlay');
      return VersionModel.listFromJson(jsonDecode(response));
    }
    catch (_) {
      rethrow;
    }
  }

  static Future<String> _getCurrentVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    }
    catch (_) {
      rethrow;
    }
  }
}