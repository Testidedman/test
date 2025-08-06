import 'package:drift/drift.dart';

class FavouritesTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get year => integer()();
  IntColumn get pages => integer()();
  TextColumn get profilePicture => text()();
  IntColumn get authorId => integer()();
  TextColumn get genres => text()();
  TextColumn get author => text().nullable()();
  RealColumn get averageRating => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
} 