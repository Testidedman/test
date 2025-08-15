// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BookModelTableTable extends BookModelTable
    with TableInfo<$BookModelTableTable, BookModelTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BookModelTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<int> pages = GeneratedColumn<int>(
      'pages', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _profilePictureMeta =
      const VerificationMeta('profilePicture');
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
      'profile_picture', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorIdMeta =
      const VerificationMeta('authorId');
  @override
  late final GeneratedColumn<int> authorId = GeneratedColumn<int>(
      'author_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<int>, String> genres =
      GeneratedColumn<String>('genres', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<int>>($BookModelTableTable.$convertergenres);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, year, pages, profilePicture, authorId, genres];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'book_model_table';
  @override
  VerificationContext validateIntegrity(Insertable<BookModelTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('pages')) {
      context.handle(
          _pagesMeta, pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta));
    } else if (isInserting) {
      context.missing(_pagesMeta);
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
          _profilePictureMeta,
          profilePicture.isAcceptableOrUnknown(
              data['profile_picture']!, _profilePictureMeta));
    } else if (isInserting) {
      context.missing(_profilePictureMeta);
    }
    if (data.containsKey('author_id')) {
      context.handle(_authorIdMeta,
          authorId.isAcceptableOrUnknown(data['author_id']!, _authorIdMeta));
    } else if (isInserting) {
      context.missing(_authorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  BookModelTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BookModelTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year'])!,
      pages: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pages'])!,
      profilePicture: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}profile_picture'])!,
      authorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}author_id'])!,
      genres: $BookModelTableTable.$convertergenres.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres'])!),
    );
  }

  @override
  $BookModelTableTable createAlias(String alias) {
    return $BookModelTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<int>, String> $convertergenres =
      const IntListConverter();
}

class BookModelTableData extends DataClass
    implements Insertable<BookModelTableData> {
  final String id;
  final String title;
  final int year;
  final int pages;
  final String profilePicture;
  final int authorId;
  final List<int> genres;
  const BookModelTableData(
      {required this.id,
      required this.title,
      required this.year,
      required this.pages,
      required this.profilePicture,
      required this.authorId,
      required this.genres});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['year'] = Variable<int>(year);
    map['pages'] = Variable<int>(pages);
    map['profile_picture'] = Variable<String>(profilePicture);
    map['author_id'] = Variable<int>(authorId);
    {
      map['genres'] =
          Variable<String>($BookModelTableTable.$convertergenres.toSql(genres));
    }
    return map;
  }

  BookModelTableCompanion toCompanion(bool nullToAbsent) {
    return BookModelTableCompanion(
      id: Value(id),
      title: Value(title),
      year: Value(year),
      pages: Value(pages),
      profilePicture: Value(profilePicture),
      authorId: Value(authorId),
      genres: Value(genres),
    );
  }

  factory BookModelTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BookModelTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      year: serializer.fromJson<int>(json['year']),
      pages: serializer.fromJson<int>(json['pages']),
      profilePicture: serializer.fromJson<String>(json['profilePicture']),
      authorId: serializer.fromJson<int>(json['authorId']),
      genres: serializer.fromJson<List<int>>(json['genres']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'year': serializer.toJson<int>(year),
      'pages': serializer.toJson<int>(pages),
      'profilePicture': serializer.toJson<String>(profilePicture),
      'authorId': serializer.toJson<int>(authorId),
      'genres': serializer.toJson<List<int>>(genres),
    };
  }

  BookModelTableData copyWith(
          {String? id,
          String? title,
          int? year,
          int? pages,
          String? profilePicture,
          int? authorId,
          List<int>? genres}) =>
      BookModelTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year ?? this.year,
        pages: pages ?? this.pages,
        profilePicture: profilePicture ?? this.profilePicture,
        authorId: authorId ?? this.authorId,
        genres: genres ?? this.genres,
      );
  BookModelTableData copyWithCompanion(BookModelTableCompanion data) {
    return BookModelTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      year: data.year.present ? data.year.value : this.year,
      pages: data.pages.present ? data.pages.value : this.pages,
      profilePicture: data.profilePicture.present
          ? data.profilePicture.value
          : this.profilePicture,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      genres: data.genres.present ? data.genres.value : this.genres,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BookModelTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('pages: $pages, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('authorId: $authorId, ')
          ..write('genres: $genres')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, year, pages, profilePicture, authorId, genres);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookModelTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.year == this.year &&
          other.pages == this.pages &&
          other.profilePicture == this.profilePicture &&
          other.authorId == this.authorId &&
          other.genres == this.genres);
}

class BookModelTableCompanion extends UpdateCompanion<BookModelTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> year;
  final Value<int> pages;
  final Value<String> profilePicture;
  final Value<int> authorId;
  final Value<List<int>> genres;
  final Value<int> rowid;
  const BookModelTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.year = const Value.absent(),
    this.pages = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.authorId = const Value.absent(),
    this.genres = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BookModelTableCompanion.insert({
    required String id,
    required String title,
    required int year,
    required int pages,
    required String profilePicture,
    required int authorId,
    required List<int> genres,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        year = Value(year),
        pages = Value(pages),
        profilePicture = Value(profilePicture),
        authorId = Value(authorId),
        genres = Value(genres);
  static Insertable<BookModelTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? year,
    Expression<int>? pages,
    Expression<String>? profilePicture,
    Expression<int>? authorId,
    Expression<String>? genres,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (year != null) 'year': year,
      if (pages != null) 'pages': pages,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (authorId != null) 'author_id': authorId,
      if (genres != null) 'genres': genres,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BookModelTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? year,
      Value<int>? pages,
      Value<String>? profilePicture,
      Value<int>? authorId,
      Value<List<int>>? genres,
      Value<int>? rowid}) {
    return BookModelTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      pages: pages ?? this.pages,
      profilePicture: profilePicture ?? this.profilePicture,
      authorId: authorId ?? this.authorId,
      genres: genres ?? this.genres,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (pages.present) {
      map['pages'] = Variable<int>(pages.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (authorId.present) {
      map['author_id'] = Variable<int>(authorId.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(
          $BookModelTableTable.$convertergenres.toSql(genres.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BookModelTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('pages: $pages, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('authorId: $authorId, ')
          ..write('genres: $genres, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $BookModelTableTable bookModelTable = $BookModelTableTable(this);
  late final BookModelDao bookModelDao = BookModelDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bookModelTable];
}

typedef $$BookModelTableTableCreateCompanionBuilder = BookModelTableCompanion
    Function({
  required String id,
  required String title,
  required int year,
  required int pages,
  required String profilePicture,
  required int authorId,
  required List<int> genres,
  Value<int> rowid,
});
typedef $$BookModelTableTableUpdateCompanionBuilder = BookModelTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<int> year,
  Value<int> pages,
  Value<String> profilePicture,
  Value<int> authorId,
  Value<List<int>> genres,
  Value<int> rowid,
});

class $$BookModelTableTableFilterComposer
    extends Composer<_$Database, $BookModelTableTable> {
  $$BookModelTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<int>, List<int>, String> get genres =>
      $composableBuilder(
          column: $table.genres,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$BookModelTableTableOrderingComposer
    extends Composer<_$Database, $BookModelTableTable> {
  $$BookModelTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get year => $composableBuilder(
      column: $table.year, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pages => $composableBuilder(
      column: $table.pages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get authorId => $composableBuilder(
      column: $table.authorId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnOrderings(column));
}

class $$BookModelTableTableAnnotationComposer
    extends Composer<_$Database, $BookModelTableTable> {
  $$BookModelTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<int> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  GeneratedColumn<String> get profilePicture => $composableBuilder(
      column: $table.profilePicture, builder: (column) => column);

  GeneratedColumn<int> get authorId =>
      $composableBuilder(column: $table.authorId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<int>, String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);
}

class $$BookModelTableTableTableManager extends RootTableManager<
    _$Database,
    $BookModelTableTable,
    BookModelTableData,
    $$BookModelTableTableFilterComposer,
    $$BookModelTableTableOrderingComposer,
    $$BookModelTableTableAnnotationComposer,
    $$BookModelTableTableCreateCompanionBuilder,
    $$BookModelTableTableUpdateCompanionBuilder,
    (
      BookModelTableData,
      BaseReferences<_$Database, $BookModelTableTable, BookModelTableData>
    ),
    BookModelTableData,
    PrefetchHooks Function()> {
  $$BookModelTableTableTableManager(_$Database db, $BookModelTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BookModelTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BookModelTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BookModelTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<int> pages = const Value.absent(),
            Value<String> profilePicture = const Value.absent(),
            Value<int> authorId = const Value.absent(),
            Value<List<int>> genres = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BookModelTableCompanion(
            id: id,
            title: title,
            year: year,
            pages: pages,
            profilePicture: profilePicture,
            authorId: authorId,
            genres: genres,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int year,
            required int pages,
            required String profilePicture,
            required int authorId,
            required List<int> genres,
            Value<int> rowid = const Value.absent(),
          }) =>
              BookModelTableCompanion.insert(
            id: id,
            title: title,
            year: year,
            pages: pages,
            profilePicture: profilePicture,
            authorId: authorId,
            genres: genres,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BookModelTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $BookModelTableTable,
    BookModelTableData,
    $$BookModelTableTableFilterComposer,
    $$BookModelTableTableOrderingComposer,
    $$BookModelTableTableAnnotationComposer,
    $$BookModelTableTableCreateCompanionBuilder,
    $$BookModelTableTableUpdateCompanionBuilder,
    (
      BookModelTableData,
      BaseReferences<_$Database, $BookModelTableTable, BookModelTableData>
    ),
    BookModelTableData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$BookModelTableTableTableManager get bookModelTable =>
      $$BookModelTableTableTableManager(_db, _db.bookModelTable);
}
