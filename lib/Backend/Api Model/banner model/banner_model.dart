class BannerModel {
  final String imagesAddId;
  final String imagesAddImages;
  final String imagesAddDate;

  BannerModel({
    required this.imagesAddId,
    required this.imagesAddImages,
    required this.imagesAddDate,
  });

  // Factory constructor to create an instance from a JSON map
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      imagesAddId: json['images_add_id'] as String,
      imagesAddImages: json['images_add_images'] as String,
      imagesAddDate: json['images_add_date'] as String,
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'images_add_id': imagesAddId,
      'images_add_images': imagesAddImages,
      'images_add_date': imagesAddDate,
    };
  }
}
