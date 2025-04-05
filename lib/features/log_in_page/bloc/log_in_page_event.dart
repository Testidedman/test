part of 'log_in_page_bloc.dart';

class LogInPageEvent {}

class LogInPageRegistrationEvent extends LogInPageEvent {
  final String email;
  final String password;

  LogInPageRegistrationEvent({
    required this.email,
    required this.password
  });
}

class GoogleRegistrationEvent extends LogInPageEvent {
  final String email;

  GoogleRegistrationEvent({
    required this.email
  });
}