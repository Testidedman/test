part of 'loading_page_bloc.dart';

class LoadingPageState {
  final AppStatus appStatus;

  LoadingPageState({
    this.appStatus = AppStatus.none
  });

  LoadingPageState copyWith({AppStatus? appStatus}) {
    return LoadingPageState(
        appStatus: appStatus ?? this.appStatus
    );
  }
}