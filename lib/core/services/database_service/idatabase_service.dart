abstract class IDataBaseService {
  Future<void> setSystemColor(bool isDark);
  bool? getSystemColor();
  Future<void> init();
}