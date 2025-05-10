import 'package:bloc/bloc.dart';
import 'package:test_app/features/main_page/models/book_model.dart';
import 'package:test_app/features/main_page/repository/main_page_repository.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc({
    required final IMainPageRepository mainPageRepository
  }): _mainPageRepository = mainPageRepository,
        super(MainPageState()) {
    on<MainPageEventInit>(_init);
  }

  final IMainPageRepository _mainPageRepository;

  Future<void> _init(MainPageEventInit event, Emitter<MainPageState> emit) async {
    emit(state.copyWith(isLoading: true));
    final List<BookModel> books = await _mainPageRepository.getBooks();
    emit(state.copyWith(books: books, isLoading: false));
  }
}