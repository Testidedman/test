import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/constants/remote_config_constants.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/models/version_model.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/services/common_service.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';

class FirebaseRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init() async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await remoteConfig.fetchAndActivate();
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
      final List<VersionModel> versionModels = _getVersions();
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
  static List<VersionModel> _getVersions() {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      final Marketplace marketplace = GetIt.instance<AppConfig>().marketplace;
      final String marketplaceKey = marketplace.enumToString;
      final String marketplaceValue = remoteConfig.getString(marketplaceKey);
      return VersionModel.listFromJson(jsonDecode(marketplaceValue));
    } catch (_) {
      rethrow;
    }
  }

  /// Получение json с ссылками на маркетплейсы из remote конфига
  /// Конвертирование переданного enum маркетплейса в String для получения нужного значения маркетплейса по ключу в json
  @override
  Future<String> getMarketPlaceURL(Marketplace marketplace) async {
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      final String urls = remoteConfig.getString(
        RemoteConfigConstants.marketplaceUrls,
      );
      final String marketplaceKey = marketplace.enumToString;
      return jsonDecode(urls)[marketplaceKey];
    } catch (_) {
      rethrow;
    }
  }
}
