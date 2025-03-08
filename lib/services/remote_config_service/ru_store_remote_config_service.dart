import 'dart:convert';
import 'package:flutter_rustore_remoteconfig/rustore_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/constants/key_constants.dart';
import 'package:test_app/constants/remote_config_constants.dart';
import 'package:test_app/enums/app_status.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/services/common_service.dart';
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
    } catch (_) {
      rethrow;
    }
  }

  /// Получение List моделей версий из remote конфига, а также номера нашей версии
  /// Нахождение модели нашей версии среди всех остальных по её номеру
  /// Получение статуса приложения из модели нашей версии
  @override
  Future<AppStatus> getAppStatus() async {
    try {
      final List<VersionModel> versionModels = await _getVersions();
      final String currentVersion = await CommonService.getCurrentVersion();
      final VersionModel currentVersionModel = versionModels.firstWhere(
        (versionModel) => currentVersion == versionModel.version,
      );
      return currentVersionModel.appStatus;
    } catch (_) {
      return AppStatus.technicalWorks;
    }
  }

  /// Получение enum маркетплейса из конфига приложения
  /// Конвертирование маркетплейса из конфига приложения в String для получения ключа для remote конфига
  /// Получение json из remote конфига по ключу и конвертирование его в List моделей
  /* Пример json из параметра маркетплейса
  {
    "what's_new": [
      {
        "text": "Фикс багов",
        "is_fix": true,
      },
      {
        "text": "Добавление раздела "Избранное"",
        "is_fix": false,
      }
    ],
    "versions": [
      {
        "version": "1.0.3",
        "app_status": "technical_work"
      },
      {
        "version": "1.0.2",
        "app_status": "none"
      },
      {
        "version": "1.0.1",
        "app_status": "update_available"
      },
      {
        "version": "1.0.0",
        "app_status": "need_update"
      }
    ]
  }
  */
  static Future<List<VersionModel>> _getVersions() async {
    try {
      final Marketplace marketplace = GetIt.instance<AppConfig>().marketplace;
      final String marketplaceKey = marketplace.enumToString;
      final String marketplaceValue =
          await FlutterRustoreRemoteconfig.getString(
        marketplaceKey,
      );
      return VersionModel.listFromJson(jsonDecode(marketplaceValue));
    } catch (_) {
      rethrow;
    }
  }

  /// Получение json с ссылками на маркетплейсы из remote конфига
  /// Конвертирование переданного enum маркетплейса в String для получения нужного значения маркетплейса по ключу в json
  /* Пример json из marketplaces_url
  {
    [
      "google_play": "https://nikolyamba-library-site-fa70.twc1.net/docs",
      "ru_store": "https://nikolyamba-library-site-fa70.twc1.net/docs"
    ]
  }
  */
  @override
  Future<String> getMarketPlaceURL(Marketplace marketplace) async {
    try {
      final urls = await FlutterRustoreRemoteconfig.getString(
        RemoteConfigConstants.marketplaceUrls,
      );
      final marketplaceKey = marketplace.enumToString;
      return jsonDecode(urls)[marketplaceKey];
    }
    catch (_) {
      rethrow;
    }
  }
}
