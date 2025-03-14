part of 'update_available_page_bloc.dart';

class UpdateAvailablePageState {
  final bool isError;
  final String version;
  final List<FeatureModel> features;


  UpdateAvailablePageState({
    this.isError = false,
    this.version = '',
    this.features = const []
  });

  UpdateAvailablePageState copyWith({
    bool? isError,
    String? version,
    List<FeatureModel>? features
  }) {
    return UpdateAvailablePageState(
        isError: isError ?? this.isError,
        version: version ?? this.version,
        features: features ?? this.features
    );
  }
}