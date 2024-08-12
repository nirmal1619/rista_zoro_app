import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MatchScreenSliderController extends GetxController {
  final PageController pageController = PageController();
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startPageTimer();
  }

  void _startPageTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageController.hasClients) {
        final nextPage = (pageController.page!.toInt() + 1) % 4; // Number of pages
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
