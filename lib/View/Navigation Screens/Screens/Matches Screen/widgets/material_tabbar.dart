
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class MaterialTabBar extends StatelessWidget {
  const MaterialTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);

    return Material(
      type: MaterialType.canvas,
      color: isDark ? AppColors.dark : Colors.white,
      // Match the background color
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        labelColor: isDark ? AppColors.grey : AppColors.primaryColor,
        labelPadding:
        const EdgeInsets.only(right: AppSizes.spaceBtwItems * 1.5),
        // Ensure no padding between labels
        unselectedLabelColor: isDark ? AppColors.grey : AppColors.darkerGrey,
        indicatorColor:
        isDark ? AppColors.grey : AppColors.primaryColor.withOpacity(0.4),
        tabs: const [
          Padding(
            padding: EdgeInsets.zero,
            child:
            Tab(icon: Icon(CupertinoIcons.checkmark_alt), text: 'Matches'),
          ),
          Tab(icon: Icon(CupertinoIcons.heart), text: 'Liked by Me'),
          Tab(icon: Icon(CupertinoIcons.person_add), text: 'Added To Profile'),
          Tab(
              icon: Icon(CupertinoIcons.person_crop_circle_badge_exclam),
              text: 'Requested'),
          Tab(icon: Icon(CupertinoIcons.location), text: 'Near Me'),
        ],
        isScrollable: true,
      ),
    );
  }
}
