
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../Gradient/gradient.dart';

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({

    super.key, required this.onPressed, required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      height: 55,
      width: double.infinity,
      onPressed: () {},
      child: Center(
          child: Text(
            "View history",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          )),
    );
  }
}
