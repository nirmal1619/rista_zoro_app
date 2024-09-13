import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/storage/app_storage.dart';
import 'package:rista_zoro_app/utils/storage/app_storage_method.dart';

import '../../../View/Authentication Screens/screens/Login Screen/login_screen.dart';
import '../../../utils/storage/app_storage_key.dart';

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
    if (currentPageIndex.value == 2) {
      debugPrint(AppStorage.readData(AppStorageKey.isFirstTime).toString());
      // Make onboarding only visible once
      AppStorageMethod.saveDataAtOnboardingScreen();

      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}
