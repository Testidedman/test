import 'package:injectable/injectable.dart';
import 'package:test_app/core/services/network_service/network_service.dart';
import 'package:test_app/core/services/storage_service.dart';
import 'package:test_app/features/log_in_page/models/registration_model.dart';
import 'package:test_app/features/log_in_page/repository/Ilog_in_page_repository.dart';

@Injectable(as: ILogInPageRepository)
class LogInPageRepository implements ILogInPageRepository {
  LogInPageRepository ({
    required final INetworkService networkService,
    required final IStorageService storageService
  }): _networkService = networkService,
        _storageService = storageService;

  final INetworkService _networkService;
  final IStorageService _storageService;

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
    await _storageService.setToken(accessToken, refreshToken);
  }
}