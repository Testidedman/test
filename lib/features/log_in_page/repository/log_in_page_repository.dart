import 'package:test_app/core/services/database_service/idatabase_service.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/features/log_in_page/models/registration_model.dart';
import 'package:test_app/features/log_in_page/repository/Ilog_in_page_repository.dart';

class LogInPageRepository implements ILogInPageRepository {
  LogInPageRepository ({
    required final INetworkService networkService,
    required final IDataBaseService dataBaseService
  }): _networkService = networkService,
        _dataBaseService = dataBaseService;

  final INetworkService _networkService;
  final IDataBaseService _dataBaseService;

  @override
  Future<RegistrationModel> register(String email, String password) async {
    final Map<String, dynamic> registerMap = await _networkService.post(
        'register',
        {
          'email': email,
          'login': email,
          'password': password
        }
    );
    return RegistrationModel.fromJson(registerMap);
  }

  @override
  Future<void> setTokens(String accessToken, String refreshToken) async {
    await _dataBaseService.setToken(accessToken, refreshToken);
  }
}