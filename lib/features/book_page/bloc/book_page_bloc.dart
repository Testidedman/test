import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/book_page/repository/book_page_repository.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

part 'book_page_event.dart';
part 'book_page_state.dart';

@Injectable()
class BookPageBloc extends Bloc<BookPageEvent, BookPageState> {
  BookPageBloc({
    required final IBookPageRepository bookPageRepository
  }): _bookPageRepository = bookPageRepository,
        super(BookPageState()) {
    on<BookPageEventInit>(_init);
  }

  final IBookPageRepository _bookPageRepository;

  Future<void> _init(BookPageEventInit event, Emitter<BookPageState> emit) async {
    emit(state.copyWith(processStatus: ProcessStatus.loading));
    final BookModel book = await _bookPageRepository.getBook(event.bookId);
    emit(state.copyWith(
        bookModel: book,
        processStatus: ProcessStatus.success
    ));
  }
}