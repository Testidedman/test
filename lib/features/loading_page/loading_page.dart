import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/services/app_router.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/enums/app_status.dart';
import 'package:test_app/features/loading_page/bloc/loading_page_bloc.dart';
import 'package:test_app/gen/assets.gen.dart';

@RoutePage()
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoadingPageBloc>()..add(LoadingPageEventInit()),
      child: BlocListener<LoadingPageBloc, LoadingPageState>(
        listenWhen: (previous, current) {
          return previous.appStatus != current.appStatus;
        },
        listener: (context, state) {
          switch (state.appStatus) {
            case AppStatus.technicalWorks:
              context.router.push(TechnicalWorkRoute());
              break;
            case AppStatus.updateAvailable:
              context.router.push(LogInRoute());
              break;
            default:
              context.router.push(state.isLogged ? HomeRoute() : LogInRoute());
              break;
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xff121A21),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  'Manga Reader',
                  style: GoogleFonts.notoSerif(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Colors.white),
                ),
                SizedBox(height: 8),
                Image.asset(
                  Assets.images.loadingPage.path,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'We are loading your\nmanga page. This may\ntake a few seconds',
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Loading...',
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          Text(
                            '${(controller.value * 100).round()}%',
                            style: GoogleFonts.notoSerif(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: Color(0xff334D66),
                        color: Color(0xff1A80E5),
                        value: controller.value,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}