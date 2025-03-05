import 'dart:convert';
import 'package:flutter_rustore_remoteconfig/rustore_remote_config.dart';
import 'package:test_app/constants/key_constants.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/services/loading_service.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';
import 'package:flutter_rustore_remoteconfig/flutter_rustore_remoteconfig.dart';

class Parameters extends StaticParameters {
  @override
  String get deviceId => '';
}

class RuStoreRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init() async {
    try {
      await FlutterRustoreRemoteconfig.create(
        KeyConstants.ruStoreRemoteConfig,
        PluginUpdateBehavior.actualBehavior,
        15,
        StaticParameters(),
      );
    }
    catch (_) {
      rethrow;
    }
  }

  @override
  Future<AppStatus> getAppStatus() async {
    try {
      final List<VersionModel> versionModels = await _getVersions();
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

  static Future<List<VersionModel>> _getVersions() async {
    try {
      final marketplace = await FlutterRustoreRemoteconfig.getString('Google play');
      return VersionModel.listFromJson(jsonDecode(marketplace));
    }
    catch (_) {
      rethrow;
    }
  }
}
