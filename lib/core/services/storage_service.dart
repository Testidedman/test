import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class IStorageService {
  Future<bool> getSystemColor();
  Future<void> setSystemColor(bool isDark);
  Future<void> setToken(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

@Injectable(as: IStorageService)
class StorageService extends IStorageService {
  StorageService(
      this._storage
      );

  final FlutterSecureStorage _storage;
  static const String _systemColor = 'system_color';
  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';

  @override
  Future<bool> getSystemColor() async {
    final String? color = await _storage.read(key: _systemColor);
    return color == 'true';
  }

  @override
  Future<void> setSystemColor(bool isDark) async {
    await _storage.write(key: _systemColor, value: isDark.toString());
  }

  @override
  Future<void> setToken(String accessToken, String refreshToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }
}