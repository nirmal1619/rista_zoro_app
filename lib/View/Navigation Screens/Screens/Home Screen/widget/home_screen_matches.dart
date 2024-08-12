import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/view_all_profile.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../../common/widgets/ListBuilder Seprator/app_listview_seprator.dart';
import '../../../../../common/widgets/Text Formates/app_section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';

class HomeScreenMatches extends StatelessWidget {
  const HomeScreenMatches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);

    return AppCurvedContainer(
      supportDark: false,
      backgroundColor: Colors.transparent,
      isBorder: true,
      height: 270,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            child: AppSectionHeading(
              title: "Matches",
              onPressed: () => Get.to(() => const ViewAllProfile()),
            ),
          ),
          SizedBox(
            height: 200,
            child: AppListViewSeparator(
              separatorBuilder: (___, ____) => const SizedBox(),
              scrollDirection: Axis.horizontal,
              itemCount: AppImages.profileList.length,

              //item builder
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
                child: AppCurvedContainer(
                  width: 130,
                  height: 200,
                  isBorder: true,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Image container
                      Positioned.fill(
                        child: Container(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSizes.cardRadiusMd)),
                            child: Image.asset(
                              AppImages.profileList[index],
                              fit: BoxFit
                                  .cover, // Ensures the image covers the container
                            ),
                          ),
                        ),
                      ),
                      // Top icons
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(CupertinoIcons.heart),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(CupertinoIcons.person_badge_plus),
                            ),
                          ],
                        ),
                      ),
                      // View Profile text
                      Positioned(
                        child: Text(
                          AppTexts.viewProfile,
                          style: Theme.of(context).textTheme.labelSmall!.apply(
                              color: isDark
                                  ? AppColors.grey.withOpacity(0.7)
                                  : AppColors.darkGrey.withOpacity(0.7)),
                        ),
                      ),
                      // Username text
                      Positioned(
                        bottom: AppSizes.md,
                        child: Container(
                          decoration: BoxDecoration(
                              color: !isDark
                                  ? AppColors.white.withOpacity(0.4)
                                  : AppColors.dark.withOpacity(0.3),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(AppSizes.xs))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.xs),
                            child: Text(AppTexts.profileNames[index],
                                style: Theme.of(context).textTheme.labelLarge),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
