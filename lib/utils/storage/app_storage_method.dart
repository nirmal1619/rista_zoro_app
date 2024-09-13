import 'package:rista_zoro_app/Backend/Api%20Model/login%20model/login_model.dart';
import 'package:rista_zoro_app/utils/storage/app_storage.dart';

import 'app_storage_key.dart';

class AppStorageMethod {
  // Method for SplashScreen
  static Future<void> saveDataAtSplashScreen() async {
    // Implement save data logic for splash screen
  }

  // Method for OnboardingScreen
  static Future<void> saveDataAtOnboardingScreen() async {
    // Implement save data logic for onboarding screen
    await AppStorage.writeData(AppStorageKey.isFirstTime, false);
  }

  // Method for LoginScreen
  static Future<void> saveDataAtLoginScreen(
      bool rememberMe, LoginModel model) async {
    // Check if user wants to be remembered
    if (rememberMe) {
      // Save phone number, password, and rememberMe status in storage
      await AppStorage.writeData(AppStorageKey.phone, model.phoneNumber);
      await AppStorage.writeData(AppStorageKey.password, model.password);
      await AppStorage.writeData(AppStorageKey.rememberMe, true);
    } else {
      // If not remembered, clear the stored credentials
      await AppStorage.removeData(AppStorageKey.phone);
      await AppStorage.removeData(AppStorageKey.password);
      await AppStorage.writeData(AppStorageKey.rememberMe, false);
    }

    // Save the login status
    await AppStorage.writeData(AppStorageKey.isLogin, true);
  }

  // Method for SelectPersonScreen
  static Future<void> saveDataAtSelectPersonScreen() async {
    // Implement save data logic for select person screen
  }

  // Method for CreateProfileScreen
  static Future<void> saveDataAtCreateProfileScreen() async {
    await AppStorage.writeData(AppStorageKey.accountCreated, true);
    await AppStorage.writeData(AppStorageKey.allDetailsAdded, false);
    // Implement save data logic for create profile screen
  }

  // Method for OtpScreen
  static Future<void> saveDataAtOtpScreen() async {
    // Implement save data logic for OTP screen
  }

  // Method for NavigationMenuScreen
  static Future<void> saveDataAtNavigationMenuScreen() async {
    // Implement save data logic for navigation menu screen
  }

  // Method for CareerDetailsScreen
  static Future<void> saveDataAtCareerDetailsScreen() async {
    // Implement save data logic for career details screen
  }

  // Method for SocialDetailsScreen
  static Future<void> saveDataAtSocialDetailsScreen() async {
    // Implement save data logic for social details screen
  }

  // Method for FamilyDetailsScreen
  static Future<void> saveDataAtFamilyDetailsScreen() async {
    // Implement save data logic for family details screen
  }

  // Method for AddressDetailsScreen
  static Future<void> saveDataAtAddressDetailsScreen() async {
    // Implement save data logic for address details screen
  }

// Add methods for any additional screens as needed
}
