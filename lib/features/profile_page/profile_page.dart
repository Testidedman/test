import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/gen/assets.gen.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121417),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 28,
                  left: 16,
                  right: 16
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Library',
                        style: GoogleFonts.beVietnamPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 28,
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle
                    ),
                    child: Image(
                        image: AssetImage(Assets.images.avatar.path)
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Samantha, 24',
                    style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
                  Text(
                    'Joined in 2020',
                    style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff9EABB8)
                    ),
                  ),
                  Text(
                    'Manga reader',
                    style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff9EABB8)
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                            colorButton: Color(0xff293038),
                            colorText: Colors.white,
                            text: 'Upgrade',
                            onTap: () {}
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                            colorButton: Color(0xff1A80E5),
                            colorText: Colors.white,
                            text: 'Settings',
                            onTap: () {}
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Reading History',
                    style: GoogleFonts.beVietnamPro(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              height: 290,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  padding: EdgeInsets.only(
                      left: 10
                  ),
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Container(
                          height: 215,
                          width: 160,
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                  bottom: Radius.circular(12)
                              )
                          ),
                          child: Image(image: AssetImage('assets/images/image.png')),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Demon Slayer',
                          style: GoogleFonts.beVietnamPro(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white
                          ),
                        ),
                      ],
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}