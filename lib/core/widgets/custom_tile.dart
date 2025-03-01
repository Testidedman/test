import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    super.key,
    required this.image,
    required this.title,
    this.description
  });

  final String image;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.beVietnamPro(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white
              ),
            ),
            Text(
              description ?? '',
              style: GoogleFonts.beVietnamPro(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
          ],
        )
      ],
    );
  }
}
