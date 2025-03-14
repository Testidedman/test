import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/constants/image_constants.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/core/widgets/custom_tile.dart';
import 'package:test_app/features/update_available_page/available_stores_sheet.dart';
import 'package:test_app/features/update_available_page/bloc/update_available_page_bloc.dart';
import 'package:test_app/core/services/remote_config_service/firebase_remote_config_service.dart';

class UpdateAvailablePage extends StatelessWidget {
  const UpdateAvailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121417),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Image.asset(
                ImageConstants.updateImage,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 20, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Доступно обновление',
                      style: GoogleFonts.beVietnamPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Вышла обновленная версия приложения. Пожалуйста, '
                          'обновите его до последней версии, чтобы получить максимальную пользу.',
                      style: GoogleFonts.beVietnamPro(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 12),
                    CustomTile(
                        image: ImageConstants.arrow,
                        title: 'Что нового?',
                        description: 'Версия 1.0.1'
                    ),
                    SizedBox(height: 24),
                    CustomTile(
                        image: ImageConstants.arrow,
                        title: 'Добавить поддержку для IOS',
                        description: 'Версия 1.0.1'
                    ),
                    SizedBox(height: 24),
                    CustomTile(
                        image: ImageConstants.arrow,
                        title: 'Добавить поддержку для IOS',
                        description: 'Версия 1.0.1'
                    ),
                    SizedBox(height: 24),
                    CustomTile(
                        image: ImageConstants.arrow,
                        title: 'Добавить поддержку для IOS',
                        description: 'Версия 1.0.1'
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: 'Обновить сейчас',
                      colorButton: Color(0xff1A80E5),
                      colorText: Colors.white,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return BlocProvider(
                                create: (context) => UpdateAvailablePageBloc(
                                    configService: FirebaseRemoteConfigService()
                                ),
                                child: AvailableStoresSheet(),
                              );
                            }
                        );
                      },
                    ),
                    SizedBox(height: 12),
                    CustomButton(
                      text: 'Обновить позже',
                      colorButton: Color(0xff293038),
                      colorText: Colors.white,
                      onTap: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}