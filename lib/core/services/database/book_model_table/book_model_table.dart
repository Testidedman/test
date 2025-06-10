import 'package:drift/drift.dart';
import 'dart:convert';

class BookModelTable extends Table {
  TextColumn get title => text()();
  IntColumn get year => integer()();
  IntColumn get pages => integer()();
  TextColumn get profilePicture => text()();
  IntColumn get authorId => integer()();
  TextColumn get genres => text().map(const IntListConverter())();
}

class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    return (json.decode(fromDb) as List).cast<int>();
  }

  @override
  String toSql(List<int> value) {
    return json.encode(value);
  }
}