import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/database/book_model_table/book_model_dao.dart';
import 'package:test_app/core/services/database/database.dart';
import 'package:test_app/core/services/database/favourites_table/favourites_dao.dart';

@module
abstract class ServiceModule {

  @singleton
  BookModelDao getBookModelDao(Database database) => database.bookModelDao;

  @singleton
  FavouritesDao getFavouritesDao(Database database) => database.favouritesDao;

  @singleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();
}