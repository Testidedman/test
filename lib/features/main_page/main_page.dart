import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_text_field.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff121A21),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Manga Reader',
                        style: GoogleFonts.beVietnamPro(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: controller,
                      hintText: 'Поиск',
                      icon: Icons.search_rounded,
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Popular',
                      style: GoogleFonts.beVietnamPro(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 28)
                  ],
                ),
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                            height: 320,
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
                        ],
                      );
                    }
                ),
              )
            ],
          ),
        )
    );
  }
}