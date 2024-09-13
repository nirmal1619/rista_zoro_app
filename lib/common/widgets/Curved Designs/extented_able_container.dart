import 'package:flutter/cupertino.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper.dart';

class ExtenedAbleContainer extends StatelessWidget {
  final Widget child;
  const ExtenedAbleContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Container(
        constraints: const BoxConstraints(maxHeight: 80, minHeight: 55),
        decoration: BoxDecoration(
            color:
                isDark ? AppColors.darkerGrey : AppColors.grey.withOpacity(0.7),
            border: Border.all(
                color: isDark
                    ? AppColors.grey.withOpacity(0.3)
                    : AppColors.dark.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg)),
        child: child);
  }
}
