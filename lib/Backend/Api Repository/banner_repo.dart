import 'dart:developer';

import '../Api Model/banner model/banner_response.dart';
import '../Api Services/extended_api_services.dart';
import '../Api utils/Api Constants/api_urls.dart';

class BannerRepo {
  final NetworkApiServices _networkApiServices = NetworkApiServices();

  Future<List<String>> getBanners() async {
    try {
      // Attempt to get the banners using the API service
      final bannerDataJson =
          await _networkApiServices.getGetApiResponse(ApiUrls.getBannerApi);

      // Convert the JSON response to a BannerResponse object
      final bannerResponse = BannerResponseModel.fromJson(bannerDataJson);

      // Extract the list of Banner objects
      final banners = bannerResponse.response;
      log('Banner repo response: $banners');
      // Map the Banner objects to a list of image URLs
      final imageUrls = banners.map((banner) {
        return '${bannerResponse.imagePath}${banner.imagesAddImages}';
      }).toList();

      // Log the list of image URLs for debugging
      log('Banner image URLs: $imageUrls');

      return imageUrls;
    } catch (e) {
      // Log the exception for debugging
      log('Error in getBanners: $e');

      // Rethrow the caught exception to handle it further up the call stack
      rethrow;
    }
  }
}
