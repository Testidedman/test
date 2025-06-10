import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/flushbar_service.dart';
import 'package:test_app/core/widgets/custom_tile.dart';
import 'package:test_app/enums/marketplace.dart';
import 'package:test_app/features/update_available_page/bloc/update_available_page_bloc.dart';
import 'package:test_app/gen/assets.gen.dart';

class AvailableStoresSheet extends StatelessWidget {
  const AvailableStoresSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateAvailablePageBloc, UpdateAvailablePageState>(
      listenWhen: (previous, current) => previous.isError != current.isError,
      listener: (context, state) {
        if (state.isError) {
          FlushBarService.show(context);
        }
      },
      child: Container(
        height: 550,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(12)
          ),
          color: Color(0xff121417),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 12
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTile(
                  onTap: () {
                    context.read<UpdateAvailablePageBloc>().add(
                        UpdateAvailablePageEventTapMarketPlace(
                          marketPlace: Marketplace.googlePlay,
                        )
                    );
                  },
                  image: Assets.icons.arrow,
                  title: 'Скачать',
                ),
                SizedBox(height: 24),
                CustomTile(onTap: () {
                  Navigator.pop(context);
                  context.read<UpdateAvailablePageBloc>().add(
                      UpdateAvailablePageEventDownloadAPK()
                  );
                },
                  image: Assets.icons.arrow,
                  title: 'Скачать APK - файл',
                ),
                SizedBox(height: 24),
                CustomTile(
                  image: Assets.icons.arrow,
                  title: 'Что нового?',
                ),
                SizedBox(height: 24),
                CustomTile(
                  image: Assets.icons.arrow,
                  title: 'Что нового?',
                ),
                SizedBox(height: 24),
                CustomTile(
                  image: Assets.icons.arrow,
                  title: 'Что нового?',
                ),
                SizedBox(height: 24),
                CustomTile(
                  image: Assets.icons.arrow,
                  title: 'Что нового?',
                ),
                SizedBox(height: 24),
                CustomTile(
                  image: Assets.icons.arrow,
                  title: 'Что нового?',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}