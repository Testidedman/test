import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/features/favourites_page/bloc/favourites_page_bloc.dart';
import 'package:test_app/features/favourites_page/widgets/favourites_body.dart';

@RoutePage()
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();
    // Load favourites will be triggered by BlocBuilder
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavouritesPageBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          backgroundColor: const Color(0xff1A2633),
          foregroundColor: Colors.white,
        ),
        backgroundColor: const Color(0xff1A2633),
        body: FavouritesBody(),
      ),
    );
  }
}
