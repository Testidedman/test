import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/database/book_model_table/book_model_dao.dart';
import 'package:test_app/core/services/database/database.dart';

@module
abstract class ServiceModule {

  @singleton
  BookModelDao getBookModelDao(Database database) => database.bookModelDao;

  @singleton
  FlutterSecureStorage get secureStorage => FlutterSecureStorage();
}