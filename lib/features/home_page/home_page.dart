import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/utils/app_config.dart';
import 'package:test_app/features/home_page/bloc/home_page_bloc.dart';
import 'package:test_app/features/home_page/widgets/custom_bottom_bar.dart';
import 'package:test_app/features/settings_page/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              Navigator(
                key: GetIt.instance<AppConfig>().homeKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) =>
                      Container(
                        height: 50,
                        color: Colors.blueAccent,
                      ),
                ),
              ),
              Navigator(
                key: GetIt.instance<AppConfig>().searchKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) =>
                      Container(
                        height: 50,
                        color: Colors.amber,
                      ),
                ),
              ),
              Navigator(
                key: GetIt.instance<AppConfig>().favoritesKey,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) =>
                      Container(
                        height: 50,
                        color: Colors.white,
                      ),
                ),
              ),
              Navigator(
                key: GetIt.instance<AppConfig>().settingsKey,
                onGenerateRoute: (route) => SettingsPage.route(),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Color(0xff1A2633),
              padding: EdgeInsets.only(
                  top: 12,
                  bottom: 12 + MediaQuery.of(context).padding.bottom
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(onTap: () {
                    controller.jumpToPage(0);
                    context.read<HomePageBloc>().add(ChangePageEvent(
                        index: 0
                    ));
                  },
                    child: CustomBottomBar(
                        index: 0,
                        text: 'Home',
                        icon: Icons.home
                    ),
                  ),
                  GestureDetector(onTap: () {
                    controller.jumpToPage(1);
                    context.read<HomePageBloc>().add(ChangePageEvent(
                        index: 1
                    ));
                  },
                    child: CustomBottomBar(
                        index: 1,
                        text: 'Search',
                        icon: Icons.search_rounded
                    ),
                  ),
                  GestureDetector(onTap: () {
                    controller.jumpToPage(2);
                    context.read<HomePageBloc>().add(ChangePageEvent(
                        index: 2
                    ));
                  },
                    child: CustomBottomBar(
                        index: 2,
                        text: 'Favorites',
                        icon: Icons.bookmark_border
                    ),
                  ),
                  GestureDetector(onTap: () {
                    controller.jumpToPage(3);
                    context.read<HomePageBloc>().add(ChangePageEvent(
                        index: 3
                    ));
                  },
                    child: CustomBottomBar(
                        index: 3,
                        text: 'Settings',
                        icon: Icons.settings
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}