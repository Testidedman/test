import 'package:flutter/material.dart';
import 'package:test_app/constants/image_constants.dart';
import 'package:test_app/core/widgets/custom_tile.dart';

class AvailableStoresSheet extends StatelessWidget {
  const AvailableStoresSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(12)
        ),
        color: Color(0xff121417),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
              SizedBox(height: 24),
              CustomTile(
                image: ImageConstants.arrow,
                title: 'Что нового?',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
