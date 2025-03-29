import 'package:flutter/material.dart';
import 'package:test_app/core/services/database_service/database_service.dart';
import 'package:test_app/core/services/database_service/idatabase_service.dart';

class SystemColorService {

  static Color getSystemColor(BuildContext context) {
    final IDataBaseService database = DataBaseService();
    late bool isDark;
    if (database.getSystemColor() == null) {
      isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
      database.setSystemColor(isDark);
    } else {
      isDark = database.getSystemColor()!;
    }

    return isDark ? Color(0xff121A21) : Colors.white;
  }
}