import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/features/favourites_page/repository/favourites_page_repository.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

part 'favourites_page_event.dart';
part 'favourites_page_state.dart';

@Injectable()
class FavouritesPageBloc extends Bloc<FavouritesPageEvent, FavouritesPageState> {
  FavouritesPageBloc({
    required final IFavouritesPageRepository favouritesPageRepository,
  }): _favouritesPageRepository = favouritesPageRepository,
        super(FavouritesPageState()) {
    on<LoadFavouritesEvent>(_loadFavourites);
    on<AddToFavouritesEvent>(_addToFavourites);
    on<RemoveFromFavouritesEvent>(_removeFromFavourites);
  }

  final IFavouritesPageRepository _favouritesPageRepository;

  Future<void> _loadFavourites(LoadFavouritesEvent event, Emitter<FavouritesPageState> emit) async {
    try {
      emit(state.copyWith(isLoading: true));
      final List<BookModel> favourites = await _favouritesPageRepository.getFavourites();
      emit(state.copyWith(
        isLoading: false,
        favourites: favourites,
      ));
    } catch (error) {
      print('❌ Error loading favourites: $error');
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _addToFavourites(AddToFavouritesEvent event, Emitter<FavouritesPageState> emit) async {
    try {
      await _favouritesPageRepository.addToFavourites(event.bookId);
      // Reload favourites after adding
      add(LoadFavouritesEvent());
    } catch (error) {
      print('❌ Error adding to favourites: $error');
    }
  }

  Future<void> _removeFromFavourites(RemoveFromFavouritesEvent event, Emitter<FavouritesPageState> emit) async {
    try {
      await _favouritesPageRepository.removeFromFavourites(event.bookId);
      // Reload favourites after removing
      add(LoadFavouritesEvent());
    } catch (error) {
      print('❌ Error removing from favourites: $error');
    }
  }
} 