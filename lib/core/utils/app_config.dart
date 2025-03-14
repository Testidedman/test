import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/services/remote_config_service/remote_config_service.dart';

class AppConfig {
  final RemoteConfigService remoteConfigService;
  final Marketplace marketplace;

  AppConfig({
    required this.remoteConfigService,
    required this.marketplace
  });
}