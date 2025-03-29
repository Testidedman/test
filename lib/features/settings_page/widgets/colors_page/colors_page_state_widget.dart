import 'package:flutter/material.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page_inherited.dart';

class ColorsPageStateWidget extends StatefulWidget {
  const ColorsPageStateWidget({super.key});

  static ColorsPageStateWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<ColorsPageStateWidgetState>()!;
  }

  @override
  State<ColorsPageStateWidget> createState() => ColorsPageStateWidgetState();
}

class ColorsPageStateWidgetState extends State<ColorsPageStateWidget> {

  bool _isDark = false;

  void test(bool isDark) {
    _isDark = isDark;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ColorsPageInherited(
        isDark: _isDark,
        child: ColorsPage()
    );
  }
}
