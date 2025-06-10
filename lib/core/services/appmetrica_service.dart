import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppmetricaService {

  static Future<void> init() async {
    try {
      await AppMetrica.activate(
          AppMetricaConfig(dotenv.env['APPMETRICA_API_KEY']!) ///TODO: Колян работай
      );
    }
    catch (_) {
      rethrow;
    }
  }
}