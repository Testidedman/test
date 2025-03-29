import 'package:flutter/material.dart';

class ColorsPageInherited extends InheritedWidget {
  const ColorsPageInherited({
    super.key,
    required this.isDark,
    required super.child,
  });

  final bool isDark;

  static ColorsPageInherited? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorsPageInherited>();
  }

  static ColorsPageInherited of(BuildContext context) {
    final ColorsPageInherited? result = maybeOf(context);
    return result!;
  }

  @override
  bool updateShouldNotify(ColorsPageInherited oldWidget) => isDark != oldWidget.isDark;
}