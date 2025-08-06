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

class $FavouritesTableTable extends FavouritesTable
    with TableInfo<$FavouritesTableTable, FavouritesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavouritesTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'genres', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _averageRatingMeta =
      const VerificationMeta('averageRating');
  @override
  late final GeneratedColumn<double> averageRating = GeneratedColumn<double>(
      'average_rating', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        year,
        pages,
        profilePicture,
        authorId,
        genres,
        author,
        averageRating,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<FavouritesTableData> instance,
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
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres']!, _genresMeta));
    } else if (isInserting) {
      context.missing(_genresMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('average_rating')) {
      context.handle(
          _averageRatingMeta,
          averageRating.isAcceptableOrUnknown(
              data['average_rating']!, _averageRatingMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavouritesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavouritesTableData(
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
      genres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      averageRating: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}average_rating']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FavouritesTableTable createAlias(String alias) {
    return $FavouritesTableTable(attachedDatabase, alias);
  }
}

class FavouritesTableData extends DataClass
    implements Insertable<FavouritesTableData> {
  final String id;
  final String title;
  final int year;
  final int pages;
  final String profilePicture;
  final int authorId;
  final String genres;
  final String? author;
  final double? averageRating;
  final DateTime createdAt;
  const FavouritesTableData(
      {required this.id,
      required this.title,
      required this.year,
      required this.pages,
      required this.profilePicture,
      required this.authorId,
      required this.genres,
      this.author,
      this.averageRating,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['year'] = Variable<int>(year);
    map['pages'] = Variable<int>(pages);
    map['profile_picture'] = Variable<String>(profilePicture);
    map['author_id'] = Variable<int>(authorId);
    map['genres'] = Variable<String>(genres);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || averageRating != null) {
      map['average_rating'] = Variable<double>(averageRating);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavouritesTableCompanion toCompanion(bool nullToAbsent) {
    return FavouritesTableCompanion(
      id: Value(id),
      title: Value(title),
      year: Value(year),
      pages: Value(pages),
      profilePicture: Value(profilePicture),
      authorId: Value(authorId),
      genres: Value(genres),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      averageRating: averageRating == null && nullToAbsent
          ? const Value.absent()
          : Value(averageRating),
      createdAt: Value(createdAt),
    );
  }

  factory FavouritesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavouritesTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      year: serializer.fromJson<int>(json['year']),
      pages: serializer.fromJson<int>(json['pages']),
      profilePicture: serializer.fromJson<String>(json['profilePicture']),
      authorId: serializer.fromJson<int>(json['authorId']),
      genres: serializer.fromJson<String>(json['genres']),
      author: serializer.fromJson<String?>(json['author']),
      averageRating: serializer.fromJson<double?>(json['averageRating']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'genres': serializer.toJson<String>(genres),
      'author': serializer.toJson<String?>(author),
      'averageRating': serializer.toJson<double?>(averageRating),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FavouritesTableData copyWith(
          {String? id,
          String? title,
          int? year,
          int? pages,
          String? profilePicture,
          int? authorId,
          String? genres,
          Value<String?> author = const Value.absent(),
          Value<double?> averageRating = const Value.absent(),
          DateTime? createdAt}) =>
      FavouritesTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year ?? this.year,
        pages: pages ?? this.pages,
        profilePicture: profilePicture ?? this.profilePicture,
        authorId: authorId ?? this.authorId,
        genres: genres ?? this.genres,
        author: author.present ? author.value : this.author,
        averageRating:
            averageRating.present ? averageRating.value : this.averageRating,
        createdAt: createdAt ?? this.createdAt,
      );
  FavouritesTableData copyWithCompanion(FavouritesTableCompanion data) {
    return FavouritesTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      year: data.year.present ? data.year.value : this.year,
      pages: data.pages.present ? data.pages.value : this.pages,
      profilePicture: data.profilePicture.present
          ? data.profilePicture.value
          : this.profilePicture,
      authorId: data.authorId.present ? data.authorId.value : this.authorId,
      genres: data.genres.present ? data.genres.value : this.genres,
      author: data.author.present ? data.author.value : this.author,
      averageRating: data.averageRating.present
          ? data.averageRating.value
          : this.averageRating,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('pages: $pages, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('authorId: $authorId, ')
          ..write('genres: $genres, ')
          ..write('author: $author, ')
          ..write('averageRating: $averageRating, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, year, pages, profilePicture,
      authorId, genres, author, averageRating, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavouritesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.year == this.year &&
          other.pages == this.pages &&
          other.profilePicture == this.profilePicture &&
          other.authorId == this.authorId &&
          other.genres == this.genres &&
          other.author == this.author &&
          other.averageRating == this.averageRating &&
          other.createdAt == this.createdAt);
}

class FavouritesTableCompanion extends UpdateCompanion<FavouritesTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int> year;
  final Value<int> pages;
  final Value<String> profilePicture;
  final Value<int> authorId;
  final Value<String> genres;
  final Value<String?> author;
  final Value<double?> averageRating;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const FavouritesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.year = const Value.absent(),
    this.pages = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.authorId = const Value.absent(),
    this.genres = const Value.absent(),
    this.author = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FavouritesTableCompanion.insert({
    required String id,
    required String title,
    required int year,
    required int pages,
    required String profilePicture,
    required int authorId,
    required String genres,
    this.author = const Value.absent(),
    this.averageRating = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        year = Value(year),
        pages = Value(pages),
        profilePicture = Value(profilePicture),
        authorId = Value(authorId),
        genres = Value(genres);
  static Insertable<FavouritesTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? year,
    Expression<int>? pages,
    Expression<String>? profilePicture,
    Expression<int>? authorId,
    Expression<String>? genres,
    Expression<String>? author,
    Expression<double>? averageRating,
    Expression<DateTime>? createdAt,
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
      if (author != null) 'author': author,
      if (averageRating != null) 'average_rating': averageRating,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FavouritesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<int>? year,
      Value<int>? pages,
      Value<String>? profilePicture,
      Value<int>? authorId,
      Value<String>? genres,
      Value<String?>? author,
      Value<double?>? averageRating,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return FavouritesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      pages: pages ?? this.pages,
      profilePicture: profilePicture ?? this.profilePicture,
      authorId: authorId ?? this.authorId,
      genres: genres ?? this.genres,
      author: author ?? this.author,
      averageRating: averageRating ?? this.averageRating,
      createdAt: createdAt ?? this.createdAt,
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
      map['genres'] = Variable<String>(genres.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (averageRating.present) {
      map['average_rating'] = Variable<double>(averageRating.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('pages: $pages, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('authorId: $authorId, ')
          ..write('genres: $genres, ')
          ..write('author: $author, ')
          ..write('averageRating: $averageRating, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $BookModelTableTable bookModelTable = $BookModelTableTable(this);
  late final $FavouritesTableTable favouritesTable =
      $FavouritesTableTable(this);
  late final BookModelDao bookModelDao = BookModelDao(this as Database);
  late final FavouritesDao favouritesDao = FavouritesDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bookModelTable, favouritesTable];
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
typedef $$FavouritesTableTableCreateCompanionBuilder = FavouritesTableCompanion
    Function({
  required String id,
  required String title,
  required int year,
  required int pages,
  required String profilePicture,
  required int authorId,
  required String genres,
  Value<String?> author,
  Value<double?> averageRating,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$FavouritesTableTableUpdateCompanionBuilder = FavouritesTableCompanion
    Function({
  Value<String> id,
  Value<String> title,
  Value<int> year,
  Value<int> pages,
  Value<String> profilePicture,
  Value<int> authorId,
  Value<String> genres,
  Value<String?> author,
  Value<double?> averageRating,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$FavouritesTableTableFilterComposer
    extends Composer<_$Database, $FavouritesTableTable> {
  $$FavouritesTableTableFilterComposer({
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

  ColumnFilters<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get averageRating => $composableBuilder(
      column: $table.averageRating, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$FavouritesTableTableOrderingComposer
    extends Composer<_$Database, $FavouritesTableTable> {
  $$FavouritesTableTableOrderingComposer({
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

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get averageRating => $composableBuilder(
      column: $table.averageRating,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$FavouritesTableTableAnnotationComposer
    extends Composer<_$Database, $FavouritesTableTable> {
  $$FavouritesTableTableAnnotationComposer({
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

  GeneratedColumn<String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<double> get averageRating => $composableBuilder(
      column: $table.averageRating, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$FavouritesTableTableTableManager extends RootTableManager<
    _$Database,
    $FavouritesTableTable,
    FavouritesTableData,
    $$FavouritesTableTableFilterComposer,
    $$FavouritesTableTableOrderingComposer,
    $$FavouritesTableTableAnnotationComposer,
    $$FavouritesTableTableCreateCompanionBuilder,
    $$FavouritesTableTableUpdateCompanionBuilder,
    (
      FavouritesTableData,
      BaseReferences<_$Database, $FavouritesTableTable, FavouritesTableData>
    ),
    FavouritesTableData,
    PrefetchHooks Function()> {
  $$FavouritesTableTableTableManager(_$Database db, $FavouritesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavouritesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavouritesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavouritesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<int> year = const Value.absent(),
            Value<int> pages = const Value.absent(),
            Value<String> profilePicture = const Value.absent(),
            Value<int> authorId = const Value.absent(),
            Value<String> genres = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<double?> averageRating = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavouritesTableCompanion(
            id: id,
            title: title,
            year: year,
            pages: pages,
            profilePicture: profilePicture,
            authorId: authorId,
            genres: genres,
            author: author,
            averageRating: averageRating,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required int year,
            required int pages,
            required String profilePicture,
            required int authorId,
            required String genres,
            Value<String?> author = const Value.absent(),
            Value<double?> averageRating = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FavouritesTableCompanion.insert(
            id: id,
            title: title,
            year: year,
            pages: pages,
            profilePicture: profilePicture,
            authorId: authorId,
            genres: genres,
            author: author,
            averageRating: averageRating,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavouritesTableTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $FavouritesTableTable,
    FavouritesTableData,
    $$FavouritesTableTableFilterComposer,
    $$FavouritesTableTableOrderingComposer,
    $$FavouritesTableTableAnnotationComposer,
    $$FavouritesTableTableCreateCompanionBuilder,
    $$FavouritesTableTableUpdateCompanionBuilder,
    (
      FavouritesTableData,
      BaseReferences<_$Database, $FavouritesTableTable, FavouritesTableData>
    ),
    FavouritesTableData,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$BookModelTableTableTableManager get bookModelTable =>
      $$BookModelTableTableTableManager(_db, _db.bookModelTable);
  $$FavouritesTableTableTableManager get favouritesTable =>
      $$FavouritesTableTableTableManager(_db, _db.favouritesTable);
}
