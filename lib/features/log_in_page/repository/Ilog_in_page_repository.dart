abstract class ILogInPageRepository {
  Future<void> register(String email, String password);
}