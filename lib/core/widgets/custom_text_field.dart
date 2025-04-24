import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color(0xff243647),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        children: [
          if(icon != null) ...[
            Icon(
                icon,
                color: Color(0xff94ADC7)
            ),
            SizedBox(width: 8),
          ],
          Expanded(
            child: TextField(
                controller: controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff94ADC7)
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none
                )
            ),
          ),
        ],
      ),
    );
  }
}