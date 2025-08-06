part of 'book_page_bloc.dart';

class BookPageState {
  final BookModel? bookModel;
  final ProcessStatus processStatus;
  final bool isInFavourites;

  BookPageState({
    this.bookModel,
    this.processStatus = ProcessStatus.loading,
    this.isInFavourites = false,
  });

  BookPageState copyWith({
    BookModel? bookModel,
    ProcessStatus? processStatus,
    bool? isInFavourites,
  }) {
    return BookPageState(
        bookModel: bookModel ?? this.bookModel,
        processStatus: processStatus ?? this.processStatus,
        isInFavourites: isInFavourites ?? this.isInFavourites,
    );
  }
}