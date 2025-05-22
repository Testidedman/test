import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

abstract class IMainPageRepository {
  Future<List<BookModel>> getBooks();
}

class MainPageRepository implements IMainPageRepository {
  MainPageRepository({
    required final INetworkService networkService,
  }): _networkService = networkService;

  final INetworkService _networkService;

  @override
  Future<List<BookModel>> getBooks() async {
    final response = await _networkService.get('books/rating');

    return BookModel.mocks;
    List<BookModel> books = [];
    for (var i in response) {
      books.add(BookModel.fromJson(i));
    }
    return books;
  }
}