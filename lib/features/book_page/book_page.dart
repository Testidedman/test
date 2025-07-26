import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/injector/injector.dart';
import 'package:test_app/features/book_page/bloc/book_page_bloc.dart';
import 'package:test_app/features/book_page/presentation/book_page_body.dart';

@RoutePage()
class BookPage extends StatelessWidget {
  const BookPage({
    required this.bookId,
    super.key
  });

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookPageBloc>()..add(BookPageEventInit(bookId: bookId)),
      child: Scaffold(
        backgroundColor: Color(0xff121A21),
        body: BookPageBody(),
      ),
    );
  }
}