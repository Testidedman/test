import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/database/book_model_table/book_model_dao.dart';
import 'package:test_app/core/services/database/database.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/features/main_page/models/book_model.dart';

abstract class IMainPageRepository {
  Future<List<BookModel>> getBooks();
  Future<void> setBooks(List<BookModel> books);
  Future<List<BookModel>> getBooksFromDB();
}

@Injectable(as: IMainPageRepository)
class MainPageRepository implements IMainPageRepository {
  MainPageRepository({
    required final INetworkService networkService,
    required final BookModelDao bookModelDao,
  }): _networkService = networkService,
        _bookModelDao = bookModelDao;

  final INetworkService _networkService;
  final BookModelDao _bookModelDao;

  @override
  Future<List<BookModel>> getBooks() async {
    return BookModel.mocks;
  }

  @override
  Future<void> setBooks(List<BookModel> books) async {
    for (var book in books) {
      _bookModelDao.setBook(BookModelTableData(
        title: book.title,
        year: book.year,
        pages: book.pages,
        profilePicture: book.profilePicture,
        authorId: book.authorId,
        genres: book.genres,
        id: book.id,
      ));
    }
  }

  @override
  Future<List<BookModel>> getBooksFromDB() async {
    final List<BookModelTableData> booksFromDB = await _bookModelDao.getBooks();
    final List<BookModel> books = [];
    for(var book in booksFromDB) {
      books.add(BookModel(
        title: book.title,
        year: book.year,
        pages: book.pages,
        profilePicture: book.profilePicture,
        authorId: book.authorId,
        genres: book.genres,
        id: book.id,
      ));
    }
    return books;
  }
}