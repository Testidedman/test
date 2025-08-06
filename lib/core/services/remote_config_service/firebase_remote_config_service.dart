import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/constants/remote_config_constants.dart';
import 'package:test_app/core/services/common_service.dart';
import 'package:test_app/core/services/network_service/network_config.dart';
import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/enums/app_status.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/core/models/version_model.dart';
import 'package:test_app/core/utils/app_config.dart';

class FirebaseRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> init() async {
    try {
      print('🔥 FirebaseRemoteConfig: Starting initialization...');
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      
      print('⚙️ FirebaseRemoteConfig: Setting config settings...');
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      print('✅ FirebaseRemoteConfig: Config settings set successfully');
      
      print('📡 FirebaseRemoteConfig: Fetching and activating config...');
      await remoteConfig.fetchAndActivate().timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          print('⚠️ FirebaseRemoteConfig: Fetch timeout, using cached values');
          return false; // Return false to indicate timeout
        },
      );
      print('✅ FirebaseRemoteConfig: Config fetched and activated successfully');
      
      print('📋 FirebaseRemoteConfig: Getting current version model...');
      await _getCurrentVersionModel();
      print('✅ FirebaseRemoteConfig: Current version model retrieved');
      
      print('🌐 FirebaseRemoteConfig: Getting base URL...');
      await _getBaseURL();
      print('✅ FirebaseRemoteConfig: Base URL retrieved successfully');
      
      print('✅ FirebaseRemoteConfig: Initialization completed successfully!');
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error during initialization: $error');
      print('🔄 FirebaseRemoteConfig: Using fallback values...');
      
      // Set fallback values
      await _setFallbackValues();
      print('✅ FirebaseRemoteConfig: Fallback values set successfully');
    }
  }

  Future<void> _getCurrentVersionModel() async {
    try {
      final List<VersionModel> versionModels = _getVersions();
      final String currentVersion = await CommonService.getCurrentVersion();
      final VersionModel currentVersionModel = versionModels.firstWhere(
            (versionModel) => currentVersion == versionModel.version,
      );
      final getIt = GetIt.instance;
      getIt.registerSingleton<VersionModel>(currentVersionModel);
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error getting current version model: $error');
      // Use fallback version model
      final fallbackVersionModel = VersionModel(
        version: '1.0.0',
        appStatus: AppStatus.none,
        features: [],
        isProd: false,
      );
      final getIt = GetIt.instance;
      getIt.registerSingleton<VersionModel>(fallbackVersionModel);
    }
  }

  /// Получение List моделей версий из remote конфига, а также номера нашей версии
  /// Нахождение модели нашей версии среди всех остальных по её номеру
  /// Получение статуса приложения из модели нашей версии
  @override
  Future<AppStatus> getAppStatus() async {
    try {
      final getIt = GetIt.instance;
      final currentVersionModel = getIt<VersionModel>();
      return currentVersionModel.appStatus;
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error getting app status: $error');
      return AppStatus.none; // Return none instead of technical works
    }
  }

  /// Получение enum маркетплейса из конфига приложения
  /// Конвертирование маркетплейса из конфига приложения в String для получения ключа для remote конфига
  /// Получение json из remote конфига по ключу и конвертирование его в List моделей
  /* Пример json из параметра маркетплейса
  {
    "versions": [
      {
        "version": "1.0.3",
        "app_status": "technical_work",
        "features": [
          {
            "text": "Фикс багов",
            "is_fix": true,
          },
          {
            "text": "Добавление раздела "Избранное"",
            "is_fix": false,
          }
        ],
      },
      {
        "version": "1.0.2",
        "app_status": "none",
        "features": [
          {
            "text": "Фикс багов",
            "is_fix": true,
          },
          {
            "text": "Добавление раздела "Избранное"",
            "is_fix": false,
          }
        ],
      },
      {
        "version": "1.0.1",
        "app_status": "update_available",
        "features": [
          {
            "text": "Фикс багов",
            "is_fix": true,
          },
          {
            "text": "Добавление раздела "Избранное"",
            "is_fix": false,
          }
        ],
      },
      {
        "version": "1.0.0",
        "app_status": "need_update",
        "features": [
          {
            "text": "Фикс багов",
            "is_fix": true,
          },
          {
            "text": "Добавление раздела "Избранное"",
            "is_fix": false,
          }
        ],
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
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error getting versions: $error');
      // Return fallback versions
      return [
        VersionModel(
          version: '1.0.0',
          appStatus: AppStatus.none,
          features: [],
          isProd: false,
        ),
      ];
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
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error getting marketplace URL: $error');
      // Return fallback URL
      return 'https://play.google.com/store/apps/details?id=com.example.app';
    }
  }

  Future<void> _getBaseURL() async {
    try {
      final getIt = GetIt.instance;
      final currentVersionModel = getIt<VersionModel>();
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      final String url = remoteConfig.getString(currentVersionModel.isProd
          ? RemoteConfigConstants.prodBaseURL
          : RemoteConfigConstants.devBaseURL
      );
      getIt.registerSingleton<NetworkConfig>(NetworkConfig(baseUrl: url));
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error getting base URL: $error');
      // Use fallback URL
      final getIt = GetIt.instance;
      getIt.registerSingleton<NetworkConfig>(NetworkConfig(baseUrl: 'https://api.example.com'));
    }
  }

  Future<void> _setFallbackValues() async {
    try {
      print('🔄 FirebaseRemoteConfig: Setting fallback values...');
      
      // Create a fallback version model
      final fallbackVersionModel = VersionModel(
        version: '1.0.0',
        appStatus: AppStatus.none,
        features: [],
        isProd: false,
      );
      
      final getIt = GetIt.instance;
      getIt.registerSingleton<VersionModel>(fallbackVersionModel);
      
      // Set fallback network config
      getIt.registerSingleton<NetworkConfig>(NetworkConfig(baseUrl: 'https://api.example.com'));
      
      print('✅ FirebaseRemoteConfig: Fallback values set successfully');
    } catch (error) {
      print('❌ FirebaseRemoteConfig: Error setting fallback values: $error');
    }
  }
}
