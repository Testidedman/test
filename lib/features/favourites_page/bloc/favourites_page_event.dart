part of 'favourites_page_bloc.dart';

class FavouritesPageEvent {}

class LoadFavouritesEvent extends FavouritesPageEvent {}

class AddToFavouritesEvent extends FavouritesPageEvent {
  final String bookId;

  AddToFavouritesEvent({required this.bookId});
}

class RemoveFromFavouritesEvent extends FavouritesPageEvent {
  final String bookId;

  RemoveFromFavouritesEvent({required this.bookId});
} 