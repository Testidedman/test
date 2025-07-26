import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

abstract class IBookPageRepository {
  Future<BookModel> getBook(String bookId);
}

@Injectable(as: IBookPageRepository)
class BookPageRepository implements IBookPageRepository {
  BookPageRepository({
    required final INetworkService networkService,
  }): _networkService = networkService;

  final INetworkService _networkService;

  @override
  Future<BookModel> getBook(String bookId) async {
    try {
      await _networkService.get('book/$bookId');
      return BookModel.mock;
    }
    catch (_) {
      return BookModel.mock;
    }
  }
}