import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/OnBoarding/OnBoarding%20Screen/widgets/onboarding_next_button.dart';
import 'package:rista_zoro_app/View/OnBoarding/OnBoarding%20Screen/widgets/onboarding_page.dart';
import 'package:rista_zoro_app/View/OnBoarding/OnBoarding%20Screen/widgets/onboarding_skip_button.dart';
import 'package:rista_zoro_app/View/OnBoarding/OnBoarding%20Screen/widgets/smooth_page_indicator.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/texts.dart';
import '../onBording controller/onboarding_controllers.dart';

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
              image: AppImages.onBordingImage1,
              title: AppTexts.onBoardingTitle1,
              subtitle: ""),
          OnBoardPage(
              image: AppImages.onBordingImage2,
              title: AppTexts.onBoardingTitle2,
              subtitle: ""),
          OnBoardPage(
              image: AppImages.onBordingImage3,
              title: AppTexts.onBoardingTitle3,
              subtitle: ""),
        ],
      ),
      const SkipButton(),
      const PageIndicator(),
      const OnBoardingNextbutton()
    ]));
  }
}
