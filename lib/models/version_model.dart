import 'package:test_app/constants/version_constants.dart';

enum AppStatus {
  technicalWorks,
  updateAvailable,
  needUpdate,
  none
}

class VersionModel {
  final String version;
  final AppStatus appStatus;

  VersionModel({
    required this.version,
    required this.appStatus
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
    );
  }

  static List<VersionModel> listFromJson(Map<String, dynamic> json) {
    List<VersionModel> versions = [];
    for (var version in json['payload']) {
      versions.add(VersionModel.fromJson(version));
    }
    return versions;
  }
}