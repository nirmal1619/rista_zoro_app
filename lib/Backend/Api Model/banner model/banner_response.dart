import 'banner_model.dart';

class BannerResponseModel {
  final String status;
  final String imagePath;
  final List<BannerModel> response;

  BannerResponseModel({
    required this.status,
    required this.imagePath,
    required this.response,
  });

  // Factory constructor to create an instance from a JSON map
  factory BannerResponseModel.fromJson(Map<String, dynamic> json) {
    return BannerResponseModel(
      status: json['status'] as String,
      imagePath: json['image_path'] as String,
      response: (json['Response'] as List<dynamic>)
          .map((item) => BannerModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'image_path': imagePath,
      'Response': response.map((banner) => banner.toJson()).toList(),
    };
  }
}
