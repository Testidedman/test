import 'dart:convert';

import 'package:flutter_rustore_remoteconfig/rustore_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:test_app/constants/key_constants.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';
import 'package:flutter_rustore_remoteconfig/flutter_rustore_remoteconfig.dart';

class Parameters extends StaticParameters {
  @override
  String get deviceId => '';
}

class RuStoreRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init() async {
    print("фиыврв");
    await FlutterRustoreRemoteconfig.create(
        KeyConstants.ruStoreRemoteConfig,
        PluginUpdateBehavior.actualBehavior,
        15,
        StaticParameters(),
        onBackgroundJobErrors: (value) {
          print("фиыврв $value");
        },
        onFirstLoadComplete: (value) {
          print("фиыврв $value");
        },
        onMemoryCacheUpdated: (value) {
          print("фиыврв $value");
        },
        onInitComplete: (value) {
          print("фиыврв $value");
        },
        onPersistentStorageUpdated: (value) {
          print("фиыврв $value");
        },
        onRemoteConfigNetworkRequestFailure: (value) {
          print("фиыврв $value");
        }
        );
  }

  @override
  Future<AppStatus> getAppStatus() async {
    final versionModels = await _getVersions();
    final String currentVersion = await _getCurrentVersion();
    final VersionModel currentVersionModel = versionModels.firstWhere(
            (versionModel) => currentVersion == versionModel.version
    );
    return currentVersionModel.appStatus;
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
