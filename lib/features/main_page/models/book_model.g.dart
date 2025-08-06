// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookModel _$BookModelFromJson(Map<String, dynamic> json) => _BookModel(
      id: json['id'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      profilePicture: json['profilePicture'] as String,
      authorId: (json['authorId'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => MarkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      author: json['author'] as String?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookModelToJson(_BookModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'pages': instance.pages,
      'profilePicture': instance.profilePicture,
      'authorId': instance.authorId,
      'genres': instance.genres,
      'marks': instance.marks,
      'author': instance.author,
      'averageRating': instance.averageRating,
    };

_MarkModel _$MarkModelFromJson(Map<String, dynamic> json) => _MarkModel(
      mark: (json['mark'] as num).toInt(),
      percent: (json['percent'] as num).toInt(),
    );

Map<String, dynamic> _$MarkModelToJson(_MarkModel instance) =>
    <String, dynamic>{
      'mark': instance.mark,
      'percent': instance.percent,
    };
