import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_circle_button.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page_inherited.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page_state_widget.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  Route<String> route() => MaterialPageRoute(builder: (context) {
    return ColorsPageStateWidget();
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ColorsPageInherited.of(context).isDark;

    return Scaffold(
      backgroundColor: Color(0xff121A21),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                  Text(
                    'Цвет темы',
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: 24,
                    width: 24,
                  )
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Выберите тему',
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 28),
              CustomCircleButton(
                text: 'Светлая',
                onChanged: () {
                  ColorsPageStateWidget.of(context).test(false);
                },
                isActive: !isDark,
              ),
              SizedBox(height: 20),
              CustomCircleButton(
                text: 'Тёмная',
                onChanged: () {
                  ColorsPageStateWidget.of(context).test(true);
                },
                isActive: isDark,
              )
            ],
          ),
        ),
      ),
    );
  }
}