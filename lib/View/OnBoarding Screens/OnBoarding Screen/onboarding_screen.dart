import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/OnBoarding%20Screens/OnBoarding%20Screen/widgets/onboarding_next_button.dart';
import 'package:rista_zoro_app/View/OnBoarding%20Screens/OnBoarding%20Screen/widgets/onboarding_page.dart';
import 'package:rista_zoro_app/View/OnBoarding%20Screens/OnBoarding%20Screen/widgets/onboarding_skip_button.dart';
import 'package:rista_zoro_app/View/OnBoarding%20Screens/OnBoarding%20Screen/widgets/smooth_page_indicator.dart';

import '../../../View Model/Onboarding Screen ViewModel/onBording controller/onboarding_controllers.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/texts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.updatePageIndex(index);
        },
        children: [
          OnBoardPage(
              image: AppImages.onBordingImage3,
              title: AppTexts.onBoardingTitle1,
              subtitle: "Find People of your choice from million of profiles"),
          OnBoardPage(
              image: AppImages.onBordingImage3,
              title: AppTexts.onBoardingTitle2,
              subtitle:
                  "Chat and call with people , build connection for forvever"),
          OnBoardPage(
              image: AppImages.onBordingImage3,
              title: AppTexts.onBoardingTitle3,
              subtitle: "So today begin the find the best match for you"),
        ],
      ),
      const SkipButton(),
      const PageIndicator(),
      const OnBoardingNextbutton()
    ]));
  }
}
