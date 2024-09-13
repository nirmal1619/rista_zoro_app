import 'package:flutter/material.dart';

import '../../../../View Model/Onboarding Screen ViewModel/onBording controller/onboarding_controllers.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingNextbutton extends StatelessWidget {
  const OnBoardingNextbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: AppSizes.defaultSpace,
        bottom: AppDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: const CircleBorder()),
          onPressed: () {
            OnBoardingController.instance.nextPage();
          },
          child: const Icon(Icons.arrow_forward),
        ));
  }
}
