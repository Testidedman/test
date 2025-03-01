import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.colorButton,
    required this.colorText,
    required this.text,
    required this.onTap
  });

  final Color colorButton;
  final Color colorText;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorButton
        ),
        child: Text(
          text,
          style: GoogleFonts.beVietnamPro(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: colorText
          ),
        ),
      ),
    );
  }
}