part of 'log_in_page_bloc.dart';

class LogInPageState {
  final bool isErrorEmail;
  final bool isErrorPassword;
  final ProcessStatus status;

  LogInPageState({
    this.isErrorEmail = false,
    this.isErrorPassword = false,
    this.status = ProcessStatus.success,
  });

  LogInPageState copyWith({
    bool? isErrorEmail,
    bool? isErrorPassword,
    ProcessStatus? status
  }) {
    return LogInPageState(
        isErrorEmail: isErrorEmail ?? this.isErrorEmail,
        isErrorPassword: isErrorPassword ?? this.isErrorPassword,
        status: status ?? this.status
    );
  }
}