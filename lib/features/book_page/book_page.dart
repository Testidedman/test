import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/features/main_page/models/book_model.dart';
import 'package:test_app/gen/assets.gen.dart';

@RoutePage()
class BookPage extends StatelessWidget {
  const BookPage({
    required this.bookModel,
    super.key
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121A21),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {
                  context.router.maybePop();
                },
                  child: Icon(
                      Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Icon(
                    Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
                Assets.images.loadingPage.path,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            Text(
              '',
              style: GoogleFonts.notoSerif(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
