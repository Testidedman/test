import 'package:test_app/core/services/database_service/idatabase_service.dart';
import 'package:test_app/core/services/network_service/network_service.dart';

abstract class ILoadingPageRepository {
  Future<void> getHealthCheck();
  String? get getAccessToken;
}

class LoadingPageRepository extends ILoadingPageRepository {
  LoadingPageRepository({
    required final INetworkService networkService,
    required final IDataBaseService dataBaseService,
  }): _networkService = networkService,
        _dataBaseService = dataBaseService;

  final INetworkService _networkService;
  final IDataBaseService _dataBaseService;

  @override
  Future<void> getHealthCheck() async {
    await _networkService.get('healthcheck');
  }

  @override
  String? get getAccessToken {
    return _dataBaseService.getAccessToken;
  }
}