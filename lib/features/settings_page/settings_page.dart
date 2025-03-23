import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_line_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121A21),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 24,
              right: 16,
              left: 16,
              bottom: 20
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Настройки',
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Настройки читателя',
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Размер текста'
              ),
              SizedBox(height: 32),
              CustomLineText(
                  text: 'Цвет фона'
              ),
              SizedBox(height: 32),
              Text(
                'Аккаунт',
                style: GoogleFonts.notoSerif(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Безопасность'
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Уведомления'
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Язык'
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Данные'
              ),
              SizedBox(height: 65),
              Center(
                child: Text(
                  'Выйти',
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}