import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/app_router.dart';
import 'package:test_app/features/home_page/bloc/home_page_bloc.dart';
import 'package:test_app/features/home_page/widgets/custom_bottom_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: AutoTabsScaffold(
          routes: [
            MainRoute(),
            MainRoute(),
            MainRoute(),
            SettingsRoute()
          ],
          extendBody: true,
          bottomNavigationBuilder: (context, tabsRouter) {
            return Container(
              height: 120,
              color: Color(0xff1A2633),
              padding: EdgeInsets.only(
                  top: 12,
                  bottom: 12 + MediaQuery
                      .of(context)
                      .padding
                      .bottom
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(onTap: () {
                    tabsRouter.setActiveIndex(0);
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
                    tabsRouter.setActiveIndex(1);
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
                    tabsRouter.setActiveIndex(2);
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
                    tabsRouter.setActiveIndex(3);
                    context.read<HomePageBloc>().add(ChangePageEvent(
                        index: 3
                    ));
                  },
                    child: CustomBottomBar(
                        index: 3,
                        text: 'Profile',
                        icon: Icons.person
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}