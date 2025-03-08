import 'package:test_app/enums/app_status.dart';
import 'package:test_app/enums/marketplace.dart';

abstract class RemoteConfigService {
  Future<void> init();
  Future<AppStatus> getAppStatus();
  Future<String> getMarketPlaceURL(Marketplace marketplace);
}