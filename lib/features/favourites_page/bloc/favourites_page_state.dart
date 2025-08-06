part of 'favourites_page_bloc.dart';

class FavouritesPageState {
  final bool isLoading;
  final List<BookModel> favourites;

  FavouritesPageState({
    this.isLoading = true,
    this.favourites = const [],
  });

  FavouritesPageState copyWith({
    bool? isLoading,
    List<BookModel>? favourites,
  }) {
    return FavouritesPageState(
      isLoading: isLoading ?? this.isLoading,
      favourites: favourites ?? this.favourites,
    );
  }
} 