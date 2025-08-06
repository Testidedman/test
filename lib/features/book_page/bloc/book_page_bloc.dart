import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/database/favourites_table/favourites_dao.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/book_page/repository/book_page_repository.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

part 'book_page_event.dart';
part 'book_page_state.dart';

@Injectable()
class BookPageBloc extends Bloc<BookPageEvent, BookPageState> {
  BookPageBloc({
    required final IBookPageRepository bookPageRepository,
    required final FavouritesDao favouritesDao,
  }): _bookPageRepository = bookPageRepository,
        _favouritesDao = favouritesDao,
        super(BookPageState()) {
    on<BookPageEventInit>(_init);
    on<BookPageEventToggleFavourite>(_toggleFavourite);
  }

  final IBookPageRepository _bookPageRepository;
  final FavouritesDao _favouritesDao;

  Future<void> _init(BookPageEventInit event, Emitter<BookPageState> emit) async {
    emit(state.copyWith(processStatus: ProcessStatus.loading));
    final BookModel book = await _bookPageRepository.getBook(event.bookId);
    final bool isInFavourites = await _favouritesDao.isInFavourites(event.bookId);
    emit(state.copyWith(
        bookModel: book,
        isInFavourites: isInFavourites,
        processStatus: ProcessStatus.success
    ));
  }

  Future<void> _toggleFavourite(BookPageEventToggleFavourite event, Emitter<BookPageState> emit) async {
    try {
      if (state.isInFavourites) {
        await _favouritesDao.removeFromFavourites(event.bookId);
        emit(state.copyWith(isInFavourites: false));
      } else {
        await _favouritesDao.addToFavourites(state.bookModel!);
        emit(state.copyWith(isInFavourites: true));
      }
    } catch (error) {
      print('❌ Error toggling favourite: $error');
    }
  }
}