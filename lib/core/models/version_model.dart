import 'package:test_app/core/constants/version_constants.dart';
import 'package:test_app/enums/app_status.dart';

class VersionModel {
  final String version;
  final AppStatus appStatus;
  final bool isProd;

  VersionModel({
    required this.version,
    required this.appStatus,
    required this.isProd,
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
        appStatus = AppStatus.none;
        break;
    }
    return VersionModel(
      version: json['version'],
      appStatus: appStatus,
      isProd: json['is_prod']
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