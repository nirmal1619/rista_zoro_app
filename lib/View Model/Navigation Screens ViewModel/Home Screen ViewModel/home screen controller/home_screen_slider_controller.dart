import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/helpers/show_snackbar.dart';

import '../../../../Backend/Api Repository/banner_repo.dart';

class HomeScreenSliderController extends GetxController {
  var currentPage = 0.obs;
  final pageController = PageController();
  Timer? _timer;

  var banners = <String>[].obs; // Observable list to store banner data

  // Expose a future to be used by FutureBuilder
  Future<List<String>>? bannerFuture;

  HomeScreenSliderController() {
    _startAutoSlide();
    bannerFuture = _fetchBanners(); // Assign the future to the class property
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageController.hasClients) {
        int nextPage = (currentPage.value + 1) %
            (banners.isNotEmpty
                ? banners.length
                : 1); // Use the length of banners
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        setCurrentPage(nextPage);
      }
    });
  }

  void setCurrentPage(int page) {
    currentPage.value = page;
  }

  // Method to fetch banners from the repository
  Future<List<String>> _fetchBanners() async {
    try {
      BannerRepo bannerRepo = BannerRepo();
      List<String> bannerData = await bannerRepo.getBanners().then((value) {
        return value;
      }).onError((e, stacktrace) {
        ShowSnackbar.errorMessage("Banner", "Can't load banners");
        return [];
      });

      // Update the banners observable list with fetched data
      banners.value = bannerData;

      return bannerData;
    } catch (e, stackTrace) {
      log('Error fetching banners: $e');
      log('Stack trace: $stackTrace');

      // Show an error message using a snackbar
      ShowSnackbar.errorMessage(
        'Error',
        'Failed to fetch banners. Please try again later.',
      );
      return [];
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
