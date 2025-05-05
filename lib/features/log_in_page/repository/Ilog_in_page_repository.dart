import 'package:test_app/features/log_in_page/models/registration_model.dart';

abstract class ILogInPageRepository {
  Future<RegistrationModel> register(String email, String password);
  Future<void> setTokens(String accessToken, String refreshToken);
}