import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/features/log_in_page/repository/Ilog_in_page_repository.dart';

class LogInPageRepository implements ILogInPageRepository {
  LogInPageRepository ({
    required final INetworkService networkService,
  }): _networkService = networkService;

  final INetworkService _networkService;

  @override
  Future<void> register(String email, String password) async {
    await _networkService.post(
        'register',
        {
          'email': email,
          'login': email,
          'password': password
        }
    );
  }
}