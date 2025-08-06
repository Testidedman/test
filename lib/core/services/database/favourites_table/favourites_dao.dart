import 'package:drift/drift.dart';
import 'package:test_app/core/services/database/database.dart';
import 'package:test_app/core/services/database/favourites_table/favourites_table.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

part 'favourites_dao.g.dart';

@DriftAccessor(tables: [FavouritesTable])
class FavouritesDao extends DatabaseAccessor<Database> with _$FavouritesDaoMixin {
  FavouritesDao(Database db) : super(db);

  Future<List<FavouritesTableData>> getAllFavourites() {
    return select(favouritesTable).get();
  }

  Future<FavouritesTableData?> getFavouriteById(String id) {
    return (select(favouritesTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<void> addToFavourites(BookModel book) {
    return into(favouritesTable).insert(
      FavouritesTableData(
        id: book.id,
        title: book.title,
        year: book.year,
        pages: book.pages,
        profilePicture: book.profilePicture,
        authorId: book.authorId,
        genres: book.genres.join(','),
        author: book.author,
        averageRating: book.averageRating,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> removeFromFavourites(String id) {
    return (delete(favouritesTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<bool> isInFavourites(String id) async {
    final favourite = await getFavouriteById(id);
    return favourite != null;
  }
} 