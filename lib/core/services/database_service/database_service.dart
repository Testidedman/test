import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/core/services/database_service/idatabase_service.dart';

class DataBaseService implements IDataBaseService {

  static const String _systemColor = 'system_color';
  static const String _systemColorKey = 'is_dark';

  static const String _tokens = 'tokens';
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  @override
  Future<void> init() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      Hive.init(appDir.path);
      await Hive.openBox<bool>(_systemColor);
      await Hive.openBox<String>(_tokens);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setSystemColor(bool isDark) async {
    final Box<bool> box = Hive.box<bool>(_systemColor);
    await box.put(_systemColorKey, isDark);
  }

  @override
  bool? get getSystemColor {
    final Box<bool> box = Hive.box<bool>(_systemColor);
    return box.get(_systemColorKey);
  }

  @override
  Future<void> setToken(String accessToken, String refreshToken) async {
    final Box<String> box = Hive.box<String>(_tokens);
    await box.put(_accessTokenKey, accessToken);
    await box.put(_refreshTokenKey, refreshToken);
  }

  @override
  String? get getAccessToken {
    final Box<String> box = Hive.box<String>(_tokens);
    return box.get(_accessTokenKey);
  }

  @override
  String? get getRefreshToken {
    final Box<String> box = Hive.box<String>(_tokens);
    return box.get(_refreshTokenKey);
  }
}