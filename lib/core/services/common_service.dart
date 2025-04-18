import 'package:package_info_plus/package_info_plus.dart';

class CommonService {
  static Future<String> getCurrentVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    }
    catch (_) {
      rethrow;
    }
  }
}