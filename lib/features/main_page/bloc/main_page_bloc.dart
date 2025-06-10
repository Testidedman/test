import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/main_page/models/book_model.dart';
import 'package:test_app/features/main_page/repository/main_page_repository.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

@Injectable()
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc({
    required final IMainPageRepository mainPageRepository
  }): _mainPageRepository = mainPageRepository,
        super(MainPageState()) {
    on<MainPageEventInit>(_init);
  }

  final IMainPageRepository _mainPageRepository;

  Future<void> _init(MainPageEventInit event, Emitter<MainPageState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final List<BookModel> books = await _mainPageRepository.getBooks();
      await _mainPageRepository.setBooks(books);
      emit(state.copyWith(books: books, isLoading: false));
    } catch(_) {
      final List<BookModel> books = await _mainPageRepository.getBooksFromDB();
      emit(state.copyWith(books: books, isLoading: false));
    }
  }
}