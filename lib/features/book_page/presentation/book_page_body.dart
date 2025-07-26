import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/widgets/custom_shimmer.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/book_page/bloc/book_page_bloc.dart';
import 'package:test_app/features/book_page/widgets/book_mark_indicator.dart';

class BookPageBody extends StatelessWidget {
  const BookPageBody({super.key});

  bool _shouldUpdateWidget(BookPageState previous, BookPageState current) {
    return previous.processStatus != current.processStatus;
  }

  IconData _getStarIcon(double rating, int currentStar) {
    if (rating >= currentStar) {
      return Icons.star;
    } else if (rating + 1 > currentStar) {
      return Icons.star_half;
    }
    return Icons.star_border;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          BlocBuilder<BookPageBloc, BookPageState>(
            buildWhen: _shouldUpdateWidget,
            builder: (context, state) {
              return state.processStatus.isLoading
                  ? CustomShimmer(
                weight: MediaQuery.of(context).size.width,
                height: 300,
              )
                  : Image.network(
                state.bookModel!.profilePicture,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20,
                left: 16,
                right: 16
            ),
            child: BlocBuilder<BookPageBloc, BookPageState>(
              buildWhen: _shouldUpdateWidget,
              builder: (context, state) {
                if (state.processStatus.isLoading) {
                  return CustomShimmer(
                    weight: MediaQuery.of(context).size.width,
                    height: 500,
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.bookModel!.title,
                      style: GoogleFonts.notoSerif(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      state.bookModel!.author!,
                      style: GoogleFonts.notoSerif(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff94ADC7)
                      ),
                    ),
                    SizedBox(height: 12),
                    if(state.bookModel?.averageRating != null)
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                state.bookModel!.averageRating.toString(),
                                style: GoogleFonts.notoSerif(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 36,
                                    color: Colors.white
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    _getStarIcon(state.bookModel!.averageRating!, 1),
                                    color: Color(0xff1A80E5),
                                  ),
                                  Icon(
                                    _getStarIcon(state.bookModel!.averageRating!, 2),
                                    color: Color(0xff1A80E5),
                                  ),
                                  Icon(
                                    _getStarIcon(state.bookModel!.averageRating!, 3),
                                    color: Color(0xff1A80E5),
                                  ),
                                  Icon(
                                    _getStarIcon(state.bookModel!.averageRating!, 4),
                                    color: Color(0xff1A80E5),
                                  ),
                                  Icon(
                                    _getStarIcon(state.bookModel!.averageRating!, 5),
                                    color: Color(0xff1A80E5),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(width: 32),
                          Column(
                            children: state.bookModel!.marks!.map((mark) {
                              return Column(
                                children: [
                                  BookMarkIndicator(
                                      mark: mark.mark,
                                      percent: mark.percent
                                  ),
                                  SizedBox(height: 12)
                                ],
                              );
                            }).toList(),
                          )
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}