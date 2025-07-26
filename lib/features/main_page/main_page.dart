import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/services/app_router.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/core/widgets/custom_shimmer.dart';
import 'package:test_app/core/widgets/custom_text_field.dart';
import 'package:test_app/features/main_page/bloc/main_page_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainPageBloc>()..add(MainPageEventInit()),
      child: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xff121A21),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 350,
                    child: BlocBuilder<MainPageBloc, MainPageState>(
                      buildWhen: (previous, current) {
                        return previous.books != current.books;
                      },
                      builder: (context, state) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.books.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(onTap: () {
                                context.router.push(
                                    BookRoute(
                                        bookId: ''
                                    )
                                );
                              },
                                child: Column(
                                  children: [
                                    state.isLoading
                                        ? CustomShimmer(
                                        height: 320,
                                        weight: 240
                                    )
                                        : Container(
                                      height: 320,
                                      width: 240,
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(12),
                                              bottom: Radius.circular(12)
                                          )
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                        child: Image(
                                          image: NetworkImage(
                                            state.books[index].profilePicture,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    state.isLoading
                                        ? CustomShimmer(
                                        height: 20,
                                        weight: 100
                                    )
                                        : Text(
                                      state.books[index].title,
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'Ongoing',
                      style: GoogleFonts.beVietnamPro(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  SizedBox(
                    height: 290,
                    child: BlocBuilder<MainPageBloc, MainPageState>(
                      buildWhen: (previous, current) {
                        return previous.books != current.books;
                      },
                      builder: (context, state) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.books.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  state.isLoading
                                      ? CustomShimmer(
                                      height: 213,
                                      weight: 160
                                  )
                                      : Container(
                                    height: 213,
                                    width: 160,
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(12),
                                            bottom: Radius.circular(12)
                                        )
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      child: Image(
                                        image: NetworkImage(
                                          state.books[index].profilePicture,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  state.isLoading
                                      ? CustomShimmer(
                                      height: 20,
                                      weight: 100
                                  )
                                      : Text(
                                    state.books[index].title,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              );
                            }
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40)
                ],
              ),
            ),
          )
      ),
    );
  }
}