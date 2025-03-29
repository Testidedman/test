import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLineText extends StatelessWidget {
  const CustomLineText({
    super.key,
    required this.text,
    required this.onTap
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.notoSerif(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white
            ),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: Colors.white,
            size: 28,
          )
        ],
      ),
    );
  }
}