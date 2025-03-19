class FeatureModel {
  final String text;
  final bool isFixed;

  FeatureModel({
    required this.text,
    required this.isFixed
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
        text: json['text'],
        isFixed: json['is_fix']
    );
  }
}