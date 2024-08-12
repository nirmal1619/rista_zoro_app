import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Authentication/screens/Login Screen/login_screen.dart';
import '../../OnBoarding/OnBoarding Screen/onboarding_screen.dart';

class SplashScreenController extends GetxController {
  var showFinalText = false.obs;


  void checkFirstTimeUser() async {
    final deviceStorage = GetStorage();
    bool? isFirstTime = deviceStorage.read("isFirstTime") as bool?;

    // Default to true if the value is not set
    isFirstTime ??= true;

    // Delay to show splash animation
    await Future.delayed(const Duration(seconds: 1));

    if (isFirstTime) {
      Get.off(const OnBoardingScreen());
    } else {
      Get.off(const LoginScreen());
    }
  }

  void onAnimationCompleted() {
    showFinalText.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      checkFirstTimeUser();
    });
  }
}
