import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/services/app_router.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/core/widgets/custom_text_field.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/log_in_page/bloc/log_in_page_bloc.dart';
import 'package:test_app/gen/assets.gen.dart';

@RoutePage()
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  final TextEditingController _emailController = TextEditingController(text: 'tagidick2.tagidick1@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LogInPageBloc>(),
      child: BlocListener<LogInPageBloc, LogInPageState>(
        listenWhen: (previous, current) {
          return previous.status != current.status;
        },
        listener: (context, state) {
          if (state.status.isNextPage) {
            context.router.push(HomeRoute());
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xff121A21),
          body: Column(
            children: [
              Image.asset(
                width: double.infinity,
                Assets.images.logInPage.path,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12,
                    left: 16,
                    right: 16
                ),
                child: BlocBuilder<LogInPageBloc, LogInPageState>(
                  buildWhen: (previous, current) => previous.status != current.status,
                  builder: (context, state) {
                    if (state.status.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                            controller: _emailController,
                            hintText: 'email'
                        ),
                        SizedBox(height: 24),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: 'Пароль'
                        ),
                        SizedBox(height: 24),
                        CustomButton(
                            colorButton: Color(0xff1A80E5),
                            colorText: Colors.white,
                            text: 'Войти',
                            onTap: () {
                              context.read<LogInPageBloc>().add(LogInPageRegistrationEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text
                              )
                              );
                            }
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Забыли пароль?',
                          style: GoogleFonts.beVietnamPro(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff94ADC7)
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Или войдите с помощью...',
                          style: GoogleFonts.beVietnamPro(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  colorButton: Color(0xff243647),
                                  colorText: Colors.white,
                                  text: 'VK',
                                  onTap: () {}
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: CustomButton(
                                  colorButton: Color(0xff243647),
                                  colorText: Colors.white,
                                  text: 'Sber ID',
                                  onTap: () {}
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: CustomButton(
                                  colorButton: Color(0xff243647),
                                  colorText: Colors.white,
                                  text: 'Google',
                                  onTap: () {
                                    context.read<LogInPageBloc>().add(
                                        GoogleRegistrationEvent(
                                            email: _emailController.text
                                        )
                                    );
                                  }
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        CustomButton(
                            colorButton: Color(0xff243647),
                            colorText: Colors.white,
                            text: 'Apple',
                            onTap: () {}
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}