import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
abstract class BookModel with _$BookModel {
  const factory BookModel({
    required String title,
    required int year,
    required int pages,
    required String profilePicture,
    required int authorId,
    required List<int> genres
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
        ]
    ),
    BookModel(
        title: "блядь",
        year: 1,
        pages: 10,
        profilePicture: "https://sun9-53.userapi.com/impg/oJbJSzEJd37B4WWjTDhKpptL6DozJ2ZwtlrkvA/eViSVeZURd4.jpg?size=1728x2160&quality=95&sign=7f7301e2c46201fcfcf8f3eff4bc0f0d&type=album",
        authorId: 0,
        genres: [
          0
        ]
    ),
  ];
}