import 'package:get/get.dart';

import '../../../utils/routes/app_screens.dart'; // Adjust the import according to your project structure
import '../../../utils/storage/app_storage.dart'; // Import the AppStorage class
import '../../../utils/storage/app_storage_key.dart'; // Import the storage keys

class SplashScreenController extends GetxController {
  var showFinalText = false.obs;
  late bool isFirstTime;
  late bool isLogin;

  @override
  void onInit() {
    super.onInit();
    // Assign values from storage
    assignUserStatus();
  }

  // Function to read data from storage and assign it to variables
  Future<void> assignUserStatus() async {
    // Retrieve the value of isFirstTime, defaulting to true if not found
    isFirstTime =
        (AppStorage.readData<bool>(AppStorageKey.isFirstTime)) ?? true;

    // Retrieve the value of isLogin, defaulting to false if not found
    isLogin = (AppStorage.readData<bool>(AppStorageKey.isLogin)) ?? false;

    // After assigning values, proceed to check user status
  }

  // Function to check user status and navigate accordingly
  Future<void> checkUserStatus() async {
    // Delay to show splash animation
    await Future.delayed(const Duration(seconds: 3)); // Adjusted to 3 seconds

    // Navigate based on the user status
    if (isFirstTime) {
      Get.offNamed(AppScreens.onboardingScreen);
    } else if (isLogin) {
      Get.offNamed(AppScreens.naviMenuScreen); // Navigation menu screen
    } else {
      Get.offNamed(AppScreens.loginScreen);
    }
  }

  void onAnimationCompleted() {
    showFinalText.value = true;
    Future.delayed(const Duration(seconds: 1), () {
      checkUserStatus();
    });
  }
}
