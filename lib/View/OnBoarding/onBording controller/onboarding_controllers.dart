import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Authentication/screens/Login Screen/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  void updatePageIndex(int index) {
    currentPageIndex.value = index;
  }

  void dotnaviagtionClick(index) {
    currentPageIndex = index as RxInt;
    pageController.jumpTo(index as double);
  }

  void skipPage() {
    pageController.jumpToPage(2);
  }

  void nextPage() {
    final deviceStorage = GetStorage();
    if (currentPageIndex.value == 2) {
      debugPrint(deviceStorage.read("isFirstTime").toString());
      //make onboarding only once visible
      deviceStorage.write("isFirstTime", false);

      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}
