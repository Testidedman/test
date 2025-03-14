import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/constants/image_constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with TickerProviderStateMixin {

  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
      setState(() {});
    })..forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff121A21),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Manga Reader',
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
            SizedBox(height: 8),
            Image.asset(
              ImageConstants.loadingPage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'We are loading your\nmanga page. This may\ntake a few seconds',
                    style: GoogleFonts.notoSerif(
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loading...',
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      Text(
                        '70%',
                        style: GoogleFonts.notoSerif(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(4),
                    backgroundColor: Color(0xff334D66),
                    color: Color(0xff1A80E5),
                    value: controller.value / 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}