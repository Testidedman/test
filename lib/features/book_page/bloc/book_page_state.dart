part of 'book_page_bloc.dart';

class BookPageState {
  final BookModel? bookModel;
  final ProcessStatus processStatus;

  BookPageState({
    this.bookModel,
    this.processStatus = ProcessStatus.loading
  });

  BookPageState copyWith({
    BookModel? bookModel,
    ProcessStatus? processStatus,
  }) {
    return BookPageState(
        bookModel: bookModel ?? this.bookModel,
        processStatus: processStatus ?? this.processStatus
    );
  }
}