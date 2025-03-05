import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/services/loading_service.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';

class FirebaseRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await remoteConfig.fetchAndActivate();
    }
    catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppStatus> getAppStatus() async {
    try {
      final List<VersionModel> versionModels = _getVersions();
      final String currentVersion = await LoadingService.getCurrentVersion();
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
}