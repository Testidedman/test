// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookModel {
  String get id;
  String get title;
  int get year;
  int get pages;
  String get profilePicture;
  int get authorId;
  List<int> get genres;
  List<MarkModel>? get marks;
  String? get author;
  double? get averageRating;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookModelCopyWith<BookModel> get copyWith =>
      _$BookModelCopyWithImpl<BookModel>(this as BookModel, _$identity);

  /// Serializes this BookModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            const DeepCollectionEquality().equals(other.genres, genres) &&
            const DeepCollectionEquality().equals(other.marks, marks) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      year,
      pages,
      profilePicture,
      authorId,
      const DeepCollectionEquality().hash(genres),
      const DeepCollectionEquality().hash(marks),
      author,
      averageRating);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, year: $year, pages: $pages, profilePicture: $profilePicture, authorId: $authorId, genres: $genres, marks: $marks, author: $author, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class $BookModelCopyWith<$Res> {
  factory $BookModelCopyWith(BookModel value, $Res Function(BookModel) _then) =
      _$BookModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      int year,
      int pages,
      String profilePicture,
      int authorId,
      List<int> genres,
      List<MarkModel>? marks,
      String? author,
      double? averageRating});
}

/// @nodoc
class _$BookModelCopyWithImpl<$Res> implements $BookModelCopyWith<$Res> {
  _$BookModelCopyWithImpl(this._self, this._then);

  final BookModel _self;
  final $Res Function(BookModel) _then;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? year = null,
    Object? pages = null,
    Object? profilePicture = null,
    Object? authorId = null,
    Object? genres = null,
    Object? marks = freezed,
    Object? author = freezed,
    Object? averageRating = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _self.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<int>,
      marks: freezed == marks
          ? _self.marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarkModel>?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookModel implements BookModel {
  const _BookModel(
      {required this.id,
      required this.title,
      required this.year,
      required this.pages,
      required this.profilePicture,
      required this.authorId,
      required final List<int> genres,
      final List<MarkModel>? marks,
      this.author,
      this.averageRating})
      : _genres = genres,
        _marks = marks;
  factory _BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int year;
  @override
  final int pages;
  @override
  final String profilePicture;
  @override
  final int authorId;
  final List<int> _genres;
  @override
  List<int> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<MarkModel>? _marks;
  @override
  List<MarkModel>? get marks {
    final value = _marks;
    if (value == null) return null;
    if (_marks is EqualUnmodifiableListView) return _marks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? author;
  @override
  final double? averageRating;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookModelCopyWith<_BookModel> get copyWith =>
      __$BookModelCopyWithImpl<_BookModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._marks, _marks) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      year,
      pages,
      profilePicture,
      authorId,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_marks),
      author,
      averageRating);

  @override
  String toString() {
    return 'BookModel(id: $id, title: $title, year: $year, pages: $pages, profilePicture: $profilePicture, authorId: $authorId, genres: $genres, marks: $marks, author: $author, averageRating: $averageRating)';
  }
}

/// @nodoc
abstract mixin class _$BookModelCopyWith<$Res>
    implements $BookModelCopyWith<$Res> {
  factory _$BookModelCopyWith(
          _BookModel value, $Res Function(_BookModel) _then) =
      __$BookModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int year,
      int pages,
      String profilePicture,
      int authorId,
      List<int> genres,
      List<MarkModel>? marks,
      String? author,
      double? averageRating});
}

/// @nodoc
class __$BookModelCopyWithImpl<$Res> implements _$BookModelCopyWith<$Res> {
  __$BookModelCopyWithImpl(this._self, this._then);

  final _BookModel _self;
  final $Res Function(_BookModel) _then;

  /// Create a copy of BookModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? year = null,
    Object? pages = null,
    Object? profilePicture = null,
    Object? authorId = null,
    Object? genres = null,
    Object? marks = freezed,
    Object? author = freezed,
    Object? averageRating = freezed,
  }) {
    return _then(_BookModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _self.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _self._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<int>,
      marks: freezed == marks
          ? _self._marks
          : marks // ignore: cast_nullable_to_non_nullable
              as List<MarkModel>?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _self.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$MarkModel {
  int get mark;
  int get percent;

  /// Create a copy of MarkModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MarkModelCopyWith<MarkModel> get copyWith =>
      _$MarkModelCopyWithImpl<MarkModel>(this as MarkModel, _$identity);

  /// Serializes this MarkModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarkModel &&
            (identical(other.mark, mark) || other.mark == mark) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mark, percent);

  @override
  String toString() {
    return 'MarkModel(mark: $mark, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class $MarkModelCopyWith<$Res> {
  factory $MarkModelCopyWith(MarkModel value, $Res Function(MarkModel) _then) =
      _$MarkModelCopyWithImpl;
  @useResult
  $Res call({int mark, int percent});
}

/// @nodoc
class _$MarkModelCopyWithImpl<$Res> implements $MarkModelCopyWith<$Res> {
  _$MarkModelCopyWithImpl(this._self, this._then);

  final MarkModel _self;
  final $Res Function(MarkModel) _then;

  /// Create a copy of MarkModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mark = null,
    Object? percent = null,
  }) {
    return _then(_self.copyWith(
      mark: null == mark
          ? _self.mark
          : mark // ignore: cast_nullable_to_non_nullable
              as int,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MarkModel implements MarkModel {
  const _MarkModel({required this.mark, required this.percent});
  factory _MarkModel.fromJson(Map<String, dynamic> json) =>
      _$MarkModelFromJson(json);

  @override
  final int mark;
  @override
  final int percent;

  /// Create a copy of MarkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MarkModelCopyWith<_MarkModel> get copyWith =>
      __$MarkModelCopyWithImpl<_MarkModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MarkModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MarkModel &&
            (identical(other.mark, mark) || other.mark == mark) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mark, percent);

  @override
  String toString() {
    return 'MarkModel(mark: $mark, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class _$MarkModelCopyWith<$Res>
    implements $MarkModelCopyWith<$Res> {
  factory _$MarkModelCopyWith(
          _MarkModel value, $Res Function(_MarkModel) _then) =
      __$MarkModelCopyWithImpl;
  @override
  @useResult
  $Res call({int mark, int percent});
}

/// @nodoc
class __$MarkModelCopyWithImpl<$Res> implements _$MarkModelCopyWith<$Res> {
  __$MarkModelCopyWithImpl(this._self, this._then);

  final _MarkModel _self;
  final $Res Function(_MarkModel) _then;

  /// Create a copy of MarkModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mark = null,
    Object? percent = null,
  }) {
    return _then(_MarkModel(
      mark: null == mark
          ? _self.mark
          : mark // ignore: cast_nullable_to_non_nullable
              as int,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
