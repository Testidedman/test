import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/features/technical_work_page/bloc/technical_work_bloc.dart';
import 'package:test_app/gen/assets.gen.dart';

@RoutePage()
class TechnicalWorkPage extends StatelessWidget {
  const TechnicalWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechnicalWorkBloc(),
      child: Scaffold(
        backgroundColor: Color(0xff121417),
        body: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  Assets.images.technicalWork.path,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 24, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'У нас проводятся технические работы!',
                        style: GoogleFonts.beVietnamPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Мы восстановим работу в кратчайшие сроки. '
                            'Пожалуйста, вернитесь к нам позже. Мы ценим ваше терпение.',
                        style: GoogleFonts.beVietnamPro(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  children: [
                    CustomButton(
                        colorButton: Color(0xff1A80E5),
                        colorText: Colors.white,
                        text: 'Выйти из приложения',
                        onTap: () {
                          context.read<TechnicalWorkBloc>().add(
                              TechnicalWorkEventExitApp());
                        }
                    ),
                    SizedBox(height: 12),
                    CustomButton(
                        colorButton: Color(0xff293038),
                        colorText: Colors.white,
                        text: 'Получть уведомление',
                        onTap: () {}
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}