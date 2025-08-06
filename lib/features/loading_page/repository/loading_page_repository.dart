import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/core/services/storage_service.dart';

abstract class ILoadingPageRepository {
  Future<void> getHealthCheck();
  Future<String?> getAccessToken();
}

@Injectable(as: ILoadingPageRepository)
class LoadingPageRepository extends ILoadingPageRepository {
  LoadingPageRepository({
    required final INetworkService networkService,
    required final IStorageService storageService
  }): _networkService = networkService,
        _storageService = storageService;

  final INetworkService _networkService;
  final IStorageService _storageService;

  @override
  Future<void> getHealthCheck() async {
    // Mock health check - always return true
    return;
  }

  @override
  Future<String?> getAccessToken() async {
    return _storageService.getAccessToken();
  }
}