import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/core/services/database_service/idatabase_service.dart';

class DataBaseService implements IDataBaseService {

  static const String _systemColor = 'system_color';
  static const String _systemColorKey = 'is_dark';

  @override
  Future<void> setSystemColor(bool isDark) async {
    final Box<bool> box = Hive.box<bool>(_systemColor);
    box.put(_systemColorKey, isDark);
  }

  @override
  bool? getSystemColor() {
    final Box<bool> box = Hive.box<bool>(_systemColor);
    return box.get(_systemColorKey);
  }

  @override
  Future<void> init() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      Hive.init(appDir.path);
      await Hive.openBox<bool>(_systemColor);
    } catch (e) {
      rethrow;
    }
  }
}