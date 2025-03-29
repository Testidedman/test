import 'package:test_app/core/services/network_service/network_service.dart';

abstract class ILoadingPageRepository {
  Future<void> getHealthCheck();
}

class LoadingPageRepository extends ILoadingPageRepository {
  LoadingPageRepository({
    required final INetworkService networkService,
  }): _networkService = networkService;

  final INetworkService _networkService;

  @override
  Future<void> getHealthCheck() async {
    final Map<String, dynamic> response = await _networkService.get('healthcheck');
    print(response);
  }
}