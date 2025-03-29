import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/bloc/common_bloc.dart';
import 'package:test_app/core/widgets/custom_line_text.dart';
import 'package:test_app/features/settings_page/widgets/colors_page/colors_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.read<CommonBloc>().state.color,
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
                  text: 'Размер текста', onTap: () {  },
              ),
              SizedBox(height: 32),
              CustomLineText(
                  text: 'Цвет фона',
                onTap: () {
                    Navigator.of(context).push(ColorsPage().route());
                },
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
                  text: 'Безопасность', onTap: () {  },
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Уведомления', onTap: () {  },
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Язык', onTap: () {  },
              ),
              SizedBox(height: 24),
              CustomLineText(
                  text: 'Данные', onTap: () {  },
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