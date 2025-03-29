import 'package:bloc/bloc.dart';
import 'package:test_app/enums/process_status.dart';
import 'package:test_app/features/log_in_page/repository/Ilog_in_page_repository.dart';

part 'log_in_page_event.dart';
part 'log_in_page_state.dart';

class LogInPageBloc extends Bloc<LogInPageEvent, LogInPageState> {
  LogInPageBloc({
    required final ILogInPageRepository logInPageRepository
  }): _logInPageRepository = logInPageRepository,
        super(LogInPageState()) {
    on<LogInPageRegistrationEvent>(_registration);
  }

  final ILogInPageRepository _logInPageRepository;

  Future<void> _registration(
      LogInPageRegistrationEvent event,
      Emitter<LogInPageState> emit
      ) async {
    try {
      emit(state.copyWith(status: ProcessStatus.loading));
      await _logInPageRepository.register(
          event.email,
          event.password
      );
      emit(state.copyWith(status: ProcessStatus.nextPage));
    } catch (_) {
      emit(state.copyWith(status: ProcessStatus.success));
    }
  }
}