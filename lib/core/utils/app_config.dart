import 'package:flutter/cupertino.dart';
import 'package:test_app/core/services/remote_config_service/remote_config_service.dart';
import 'package:test_app/enums/marketplace.dart';

class AppConfig {
  final RemoteConfigService remoteConfigService;
  final Marketplace marketplace;

  final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> searchKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> favoritesKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingsKey = GlobalKey<NavigatorState>();

  AppConfig({
    required this.remoteConfigService,
    required this.marketplace
  });
}