part of 'update_available_page_bloc.dart';

class UpdateAvailablePageState {
  final bool isError;

  UpdateAvailablePageState({
    this.isError = false
  });

  UpdateAvailablePageState copyWith({bool? isError}) {
    return UpdateAvailablePageState(
        isError: isError ?? this.isError
    );
  }
}