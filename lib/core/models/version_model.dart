import 'package:test_app/core/constants/version_constants.dart';
import 'package:test_app/core/models/feature_model.dart';
import 'package:test_app/enums/app_status.dart';

class VersionModel {
  final String version;
  final AppStatus appStatus;
  final bool isProd;
  final List<FeatureModel> features;

  VersionModel({
    required this.version,
    required this.appStatus,
    required this.isProd,
    required this.features
  });

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    late final AppStatus appStatus;
    switch (json['app_status']) {
      case VersionConstants.technicalWorks:
        appStatus = AppStatus.technicalWorks;
        break;
      case VersionConstants.updateAvailable:
        appStatus = AppStatus.updateAvailable;
        break;
      case VersionConstants.needUpdate:
        appStatus = AppStatus.needUpdate;
        break;
      default:
        appStatus = AppStatus.success;
        break;
    }
    return VersionModel(
      version: json['version'],
      appStatus: appStatus,
      isProd: json['is_prod'],
      features: (json['features'] as List)
          .map((featureJson) => FeatureModel.fromJson(featureJson)).toList(),
    );
  }

  static List<VersionModel> listFromJson(Map<String, dynamic> json) {
    final List<VersionModel> versions = [];
    for (var version in json['payload']) {
      versions.add(VersionModel.fromJson(version));
    }
    return versions;
  }
}