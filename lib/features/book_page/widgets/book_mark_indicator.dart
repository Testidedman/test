import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookMarkIndicator extends StatelessWidget {
  const BookMarkIndicator({
    super.key,
    required this.mark,
    required this.percent
  });

  final int mark;
  final int percent;

  @override
  Widget build(BuildContext context) {
    final double indicatorWidth = MediaQuery.of(context).size.width - 235;
    return Row(
      children: [
        Text(
          mark.toString(),
          style: GoogleFonts.notoSerif(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white
          ),
        ),
        SizedBox(width: 6),
        Stack(
          children: [
            Container(
              height: 8,
              width: indicatorWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff334D66)
              ),
            ),
            Container(
              height: 8,
              width: indicatorWidth / 100 * percent,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff1A80E5)
              ),
            ),
          ],
        ),
        SizedBox(width: 6),
        Text(
          '$percent%',
          style: GoogleFonts.notoSerif(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff94ADC7)
          ),
        ),
      ],
    );
  }
}