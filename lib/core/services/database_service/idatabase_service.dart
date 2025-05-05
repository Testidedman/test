abstract class IDataBaseService {
  Future<void> init();
  Future<void> setSystemColor(bool isDark);
  Future<void> setToken(String accessToken, String refreshToken);
  bool? get getSystemColor;
  String? get getAccessToken;
  String? get getRefreshToken;
}