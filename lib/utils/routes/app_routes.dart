import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rista_zoro_app/View/User%20Details%20Screen/enter_details_screen.dart';
import 'package:rista_zoro_app/navigation_menu.dart';

import '../../View/Authentication Screens/screens/Create Profile Screen/create_profile_screen.dart';
import '../../View/Authentication Screens/screens/Create Profile Screen/select_person_screen.dart';
import '../../View/Authentication Screens/screens/Login Screen/login_screen.dart';
import '../../View/Authentication Screens/screens/otp_screen.dart';
import '../../View/OnBoarding Screens/OnBoarding Screen/onboarding_screen.dart';
import '../../View/Splash Screen/splash screen/splash_screen.dart';
import '../../View/User Details Screen/adress_details_screen.dart';
import '../../View/User Details Screen/career_details_screen.dart';
import '../../View/User Details Screen/family_details_screen.dart';
import '../../View/User Details Screen/social_details_screen.dart';
import 'app_screens.dart';

class AppRoutes {
  static List<GetPage> getPages() => [
        // Splash Screen
        GetPage(
          name: AppScreens.splashScreen,
          page: () => const SplashScreen(),
        ),
        // Onboarding Screen
        GetPage(
          name: AppScreens.onboardingScreen,
          page: () => const OnBoardingScreen(),
        ),
        // Login Screen
        GetPage(
          name: AppScreens.loginScreen,
          page: () => const LoginScreen(),
        ),
        // Select Person Screen
        GetPage(
          name: AppScreens.selectPersonScreen,
          page: () => const SelectPersonScreen(),
        ),
        // Create Profile Screen
        GetPage(
          name: AppScreens.createProfileScreen,
          page: () => const CreateProfileScreen(),
        ),
        // OTP Screen
        GetPage(
          name: AppScreens.otpScreen,
          page: () => const OtpScreen(),
        ),
        // Navigation Menu Screen
        GetPage(
          name: AppScreens.naviMenuScreen,
          page: () => AppNavigationMenu(),
        ),
        // enter details screen
        GetPage(
          name: AppScreens.enterDetailsScreen,
          page: () => const EnterDetailsScreen(),
        ),
        // Career Details Screen

        GetPage(
          name: AppScreens.careerDetailsScreen,
          page: () => const CareerDetailsScreen(),
        ),
        // Social Details Screen
        GetPage(
          name: AppScreens.socialDetailsScreen,
          page: () => const SocialDetailsScreen(),
        ),
        // Family Details Screen
        GetPage(
          name: AppScreens.familyDetailsScreen,
          page: () => const FamilyDetailsScreen(),
        ),
        // Address Details Screen
        GetPage(
          name: AppScreens.addressDetailsScreen,
          page: () => const AddressDetailsScreen(),
        ),
        // Additional routes (if needed)

        // GetPage(
        //   name: AppScreens.homeScreen,
        //   page: () => const HomeScreen(),
        // ),
        // GetPage(
        //   name: AppScreens.matchesScreen,
        //   page: () => const MatchesScreen(),
        // ),
      ];
}
