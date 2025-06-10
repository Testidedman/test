import 'package:flutter/material.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/core/services/storage_service.dart';

class SystemColorService {

  static Future<Color> getSystemColor(BuildContext context) async {
    final IStorageService storageService = getIt<IStorageService>();
    late bool isDark;
    final systemColor = await storageService.getSystemColor();
    if (systemColor) {
      isDark = systemColor;
    } else {
      isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
      storageService.setSystemColor(isDark);
    }

    return isDark ? Color(0xff121A21) : Colors.white;
  }
}