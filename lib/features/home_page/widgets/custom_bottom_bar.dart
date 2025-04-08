import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/features/home_page/bloc/home_page_bloc.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.index,
    required this.text,
    required this.icon
  });

  final int index;
  final String text;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Column(
          children: [
            Icon(
              icon,
              size: 36,
              color: state.index == index ? Colors.white : Color(0xff94ADC7),
            ),
            Text(
              text,
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: state.index == index ? Colors.white : Color(0xff94ADC7)
              ),
            ),
          ],
        );
      },
    );
  }
}