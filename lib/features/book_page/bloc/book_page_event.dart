part of 'book_page_bloc.dart';

class BookPageEvent {}

class BookPageEventInit extends BookPageEvent {
  final String bookId;

  BookPageEventInit({
    required this.bookId
  });
}