import 'package:drift/drift.dart';
import 'package:test_app/core/services/database/book_model_table/book_model_table.dart';
import 'package:test_app/core/services/database/database.dart';

part 'book_model_dao.g.dart';

@DriftAccessor(tables: <Type>[BookModelTable])
class BookModelDao extends DatabaseAccessor<Database> with _$BookModelDaoMixin {
  BookModelDao(super.db);

  Future<void> setBook(BookModelTableData book) =>
  into(bookModelTable).insert(book);

  Future<List<BookModelTableData>> getBooks() =>
  select(bookModelTable).get();
}