part of 'loading_page_bloc.dart';

class LoadingPageState {
  final AppStatus appStatus;
  final bool isLogged;

  LoadingPageState({
    this.appStatus = AppStatus.none,
    this.isLogged = false,
  });

  LoadingPageState copyWith({
    AppStatus? appStatus,
    bool? isLogged
  }) {
    return LoadingPageState(
        appStatus: appStatus ?? this.appStatus,
        isLogged: isLogged ?? this.isLogged
    );
  }
}