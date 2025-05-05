class RegistrationModel {
  final String accessToken;
  final String refreshToken;

  RegistrationModel({
    required this.accessToken,
    required this.refreshToken
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
        accessToken: json['access_token'],
        refreshToken: json ['refresh_token']
    );
  }
}