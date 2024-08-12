
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../onBording controller/onboarding_controllers.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });
  // final BuildContext context;
  @override
  Widget build(BuildContext context) {
    final isDark=Get.isDarkMode;
  final controller=Get.put(OnBoardingController());
    return Positioned(
        left: AppSizes.defaultSpace,
        bottom: AppDeviceUtils.getBottomNavigationBarHeight() + 20,
        child: SmoothPageIndicator(

          controller: controller.pageController,
          onDotClicked: controller.dotnaviagtionClick,
          count: 3,
          effect: ExpandingDotsEffect(



              activeDotColor: isDark? AppColors.light: AppColors.dark),
        ));
  }
}