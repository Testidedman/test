import 'package:test_app/models/version_model.dart';

abstract class RemoteConfigService {
  Future<void> init();
  Future<AppStatus> getAppStatus();
  Future<String> getMarketPlaceURL(String marketPlace);
}