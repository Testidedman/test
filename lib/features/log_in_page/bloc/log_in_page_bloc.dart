import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/log_in_page/models/registration_model.dart';
import 'package:test_app/features/log_in_page/repository/Ilog_in_page_repository.dart';

part 'log_in_page_event.dart';
part 'log_in_page_state.dart';

@Injectable()
class LogInPageBloc extends Bloc<LogInPageEvent, LogInPageState> {
  LogInPageBloc({
    required final ILogInPageRepository logInPageRepository
  }): _logInPageRepository = logInPageRepository,
        super(LogInPageState()) {
    on<LogInPageRegistrationEvent>(_registration);
    on<GoogleRegistrationEvent>(_googleRegistration);
  }

  final ILogInPageRepository _logInPageRepository;

  Future<void> _registration(
      LogInPageRegistrationEvent event,
      Emitter<LogInPageState> emit
      ) async {
    try {
      emit(state.copyWith(status: ProcessStatus.loading));
      final RegistrationModel register = await _logInPageRepository.register(
          event.email,
          event.password
      );
      await _logInPageRepository.setTokens(
          register.accessToken,
          register.refreshToken
      );
      emit(state.copyWith(status: ProcessStatus.nextPage));
    } catch (_) {
      emit(state.copyWith(status: ProcessStatus.success));
    }
  }

  Future<void> _googleRegistration(
      GoogleRegistrationEvent event,
      Emitter<LogInPageState> emit
      ) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final googleUser = await googleSignIn.signIn();
      print(googleUser?.email);
    } catch (error) {
      print(error);
    }
  }
}