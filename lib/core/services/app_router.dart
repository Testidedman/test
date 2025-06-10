import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/book_page/book_page.dart';
import 'package:test_app/features/home_page/home_page.dart';
import 'package:test_app/features/loading_page/loading_page.dart';
import 'package:test_app/features/log_in_page/log_in_page.dart';
import 'package:test_app/features/main_page/main_page.dart';
import 'package:test_app/features/main_page/models/book_model.dart';
import 'package:test_app/features/profile_page/profile_page.dart';
import 'package:test_app/features/settings_page/settings_page.dart';
import 'package:test_app/features/technical_work_page/technical_work_page.dart';
import 'package:test_app/features/update_available_page/update_available_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@Singleton()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: LogInRoute.page),
    AutoRoute(page: BookRoute.page),
    AutoRoute(page: TechnicalWorkRoute.page),
    AutoRoute(page: UpdateAvailableRoute.page),
    AutoRoute(
        page: HomeRoute.page,
        children: [
          AutoRoute(page: MainRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ]
    ),
  ];
}