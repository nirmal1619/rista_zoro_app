
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../onBording controller/onboarding_controllers.dart';
class OnBoardingNextbutton extends StatelessWidget {
  const OnBoardingNextbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark=Get.isDarkMode;
    return Positioned(
        right: AppSizes.defaultSpace,
        bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? AppColors.primaryColor : AppColors.black,
              shape: const CircleBorder()),
          onPressed: (){OnBoardingController.instance.nextPage();},child: const Icon(Icons.arrow_forward),));
  }
}
