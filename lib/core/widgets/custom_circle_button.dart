import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    required this.isActive,
    required this.text,
    required this.onChanged
  });

  final bool isActive;
  final String text;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onChanged,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: Color(0xff334D66),
                width: 1
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isActive ? Colors.blueAccent : Color(0xff334D66),
                      width: 2
                  )
              ),
              child: Container(
                margin: EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.blue : Colors.transparent
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}