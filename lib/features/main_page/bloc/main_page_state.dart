part of 'main_page_bloc.dart';

class MainPageState {
  final List<BookModel> books;
  final bool isLoading;

  MainPageState({
    this.books = const [],
    this.isLoading = true
  });

  MainPageState copyWith({
    List<BookModel>? books,
    bool? isLoading
  }) {
    return MainPageState(
        books: books ?? this.books,
        isLoading: isLoading ?? this.isLoading
    );
  }
}