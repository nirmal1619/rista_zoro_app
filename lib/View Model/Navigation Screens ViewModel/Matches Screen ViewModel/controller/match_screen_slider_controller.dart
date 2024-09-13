import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Backend/Api Repository/banner_repo.dart';
import '../../../../utils/helpers/show_snackbar.dart';

class MatchScreenSliderController extends GetxController {
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();
  Timer? _timer;
  var banners = <String>[].obs;
  var isAtTop = true.obs; // To track if the user is at the top of the list
  var scrollDirection = ''.obs; // Track scroll direction
  // Observable for banners
  Future<List<String>>? bannerFuture;

  @override
  void onInit() {
    super.onInit();
    _startPageTimer();
    bannerFuture = _fetchBanners();
    // scrollController.addListener(_scrollListener);
  }

  // void _scrollListener() {
  //   final currentOffset = scrollController.offset;
  //   final previousOffset = scrollController.position.pixels;
  //
  //   // Determine scroll direction
  //   if (currentOffset > previousOffset) {
  //     scrollDirection.value = 'down';
  //   } else if (currentOffset < previousOffset) {
  //     scrollDirection.value = 'up';
  //   }
  //
  //   isAtTop.value = currentOffset <= 0;
  // }

  void _startPageTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients) {
        final nextPage = (pageController.page!.toInt() + 1) % banners.length;
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<List<String>> _fetchBanners() async {
    try {
      BannerRepo bannerRepo = BannerRepo();
      List<String> bannerData = await bannerRepo.getBanners().then((value) {
        return value;
      }).onError((e, stacktrace) {
        ShowSnackbar.errorMessage("Banner", "Can't load banners");
        return [];
      });

      banners.value = bannerData;
      return bannerData;
    } catch (e, stackTrace) {
      log('Error fetching banners: $e');
      log('Stack trace: $stackTrace');
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
    scrollController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
