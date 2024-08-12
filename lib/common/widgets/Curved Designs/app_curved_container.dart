import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

class AppCurvedContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  final Color? backgroundColor;
  final bool isBorder;
  final bool? supportDark;

  const AppCurvedContainer({
    super.key,
    this.child,
    this.height = 50,
    this.width,
    this.radius = AppSizes.cardRadiusMd,
    this.backgroundColor = AppColors.grey,
    this.isBorder = false,
    this.supportDark = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = AppHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: supportDark!
            ? (isDark ? AppColors.darkerGrey : backgroundColor)
            : backgroundColor,
        borderRadius: BorderRadius.circular(radius ?? 12),
        // Adjust the radius as needed
        border: isBorder
            ? Border.all(
                color: isDark
                    ? AppColors.grey
                    : AppColors.darkGrey.withOpacity(0.7),
                // Use borderColor or transparent ifnull
                width: 0.8, // Adjust border width as needed
              )
            : null, // No border if isBorder is false
      ),
      child: child,
    );
  }
}
