import 'package:appmetrica_plugin/appmetrica_plugin.dart';

class AppmetricaService {

  static Future<void> initialization() async {
    try {
      await AppMetrica.activate(
          AppMetricaConfig("9540fe21-d0fb-4298-bffc-368d703e508c") ///TODO: Колян работай
      );
    }
    catch (_) {
      rethrow;
    }
  }

}