class ErrorModel {
  final int statusCode;
  final String message;

  ErrorModel({
    required this.message,
    required this.statusCode
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        message: json['statusCode'],
        statusCode: json['message']
    );
  }
}