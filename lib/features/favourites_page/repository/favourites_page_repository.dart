import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/database/favourites_table/favourites_dao.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

abstract class IFavouritesPageRepository {
  Future<List<BookModel>> getFavourites();
  Future<void> addToFavourites(String bookId);
  Future<void> removeFromFavourites(String bookId);
}

@Injectable(as: IFavouritesPageRepository)
class FavouritesPageRepository implements IFavouritesPageRepository {
  FavouritesPageRepository({
    required final FavouritesDao favouritesDao,
  }): _favouritesDao = favouritesDao;

  final FavouritesDao _favouritesDao;

  @override
  Future<List<BookModel>> getFavourites() async {
    try {
      final favourites = await _favouritesDao.getAllFavourites();
      return favourites.map((favourite) => BookModel(
        id: favourite.id,
        title: favourite.title,
        year: favourite.year,
        pages: favourite.pages,
        profilePicture: favourite.profilePicture,
        authorId: favourite.authorId,
        genres: favourite.genres.split(',').map(int.parse).toList(),
        author: favourite.author,
        averageRating: favourite.averageRating,
      )).toList();
    } catch (error) {
      print('❌ Error getting favourites from database: $error');
      return [];
    }
  }

  @override
  Future<void> addToFavourites(String bookId) async {
    try {
      // Get book from mocks for now
      final book = BookModel.mocks.firstWhere((book) => book.id == bookId);
      await _favouritesDao.addToFavourites(book);
    } catch (error) {
      print('❌ Error adding to favourites: $error');
      rethrow;
    }
  }

  @override
  Future<void> removeFromFavourites(String bookId) async {
    try {
      await _favouritesDao.removeFromFavourites(bookId);
    } catch (error) {
      print('❌ Error removing from favourites: $error');
      rethrow;
    }
  }
} 