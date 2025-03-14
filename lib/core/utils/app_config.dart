import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/enums/marketplace.dart';

class AppConfig {
  final RemoteConfigService remoteConfigService;
  final Marketplace marketplace;

  AppConfig({
    required this.remoteConfigService,
    required this.marketplace
  });
}