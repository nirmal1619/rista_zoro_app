import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../View Model/Onboarding Screen ViewModel/onBording controller/onboarding_controllers.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: AppDeviceUtils.getAppBarHeight(),
        right: AppSizes.defaultSpace / 1.5,
        child: TextButton(
          onPressed: () {
            OnBoardingController.instance.skipPage();
          },
          child: Text(
            "Skip",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ));
  }
}
