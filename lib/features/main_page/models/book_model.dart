import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
abstract class BookModel with _$BookModel {
  const factory BookModel({
    required String id,
    required String title,
    required int year,
    required int pages,
    required String profilePicture,
    required int authorId,
    required List<int> genres,
    List<MarkModel>? marks,
    String? author,
    double? averageRating,
  }) = _BookModel;

  factory BookModel.fromJson(Map<String, Object?> json) => _$BookModelFromJson(json);

  static List<BookModel> mocks = [
    BookModel(
      title: "блядь",
      year: 0,
      pages: 5,
      profilePicture: "https://sun9-53.userapi.com/impg/oJbJSzEJd37B4WWjTDhKpptL6DozJ2ZwtlrkvA/eViSVeZURd4.jpg?size=1728x2160&quality=95&sign=7f7301e2c46201fcfcf8f3eff4bc0f0d&type=album",
      authorId: 0,
      genres: [
        0
      ],
      id: '',
    ),
    BookModel(
        title: "блядь",
        year: 1,
        pages: 10,
        profilePicture: "https://sun9-53.userapi.com/impg/oJbJSzEJd37B4WWjTDhKpptL6DozJ2ZwtlrkvA/eViSVeZURd4.jpg?size=1728x2160&quality=95&sign=7f7301e2c46201fcfcf8f3eff4bc0f0d&type=album",
        authorId: 0,
        genres: [
          0
        ],
        id: ''
    ),
  ];

  static BookModel mock = BookModel(
      title: "Шлюхи Ярославля",
      year: 0,
      pages: 5,
      profilePicture: "https://sun9-53.userapi.com/impg/oJbJSzEJd37B4WWjTDhKpptL6DozJ2ZwtlrkvA/eViSVeZURd4.jpg?size=1728x2160&quality=95&sign=7f7301e2c46201fcfcf8f3eff4bc0f0d&type=album",
      authorId: 0,
      genres: [
        0
      ],
      averageRating: 3.5,
      author: 'Колян Мразев',
      id: '',
    marks: [
      MarkModel(
          mark: 5,
          percent: 64
      ),
      MarkModel(
          mark: 4,
          percent: 65
      ),
      MarkModel(
          mark: 3,
          percent: 90,
      ),
      MarkModel(
          mark: 2,
          percent: 99,
      ),
      MarkModel(
          mark: 1,
          percent: 2
      ),
    ]
  );
}

@freezed
abstract class MarkModel with _$MarkModel {
  const factory MarkModel({
    required int mark,
    required int percent
  }) = _MarkModel;

  factory MarkModel.fromJson(Map<String, Object?> json) => _$MarkModelFromJson(json);

}