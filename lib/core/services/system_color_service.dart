import 'package:flutter/material.dart';

class SystemColorService {
  static Color getSystemColor(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return isDark ? Color(0xff121A21) : Colors.white;
  }
}