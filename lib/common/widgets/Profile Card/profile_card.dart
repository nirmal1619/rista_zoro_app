import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rista_zoro_app/common/widgets/Profile%20Card/person_profile_details.dart';
import 'package:rista_zoro_app/common/widgets/Profile%20Card/user_about_section.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

import '../../../../common/widgets/Buttons/app_elevated_icon_button.dart';
import '../../../../utils/constants/texts.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, });

  @override
  Widget build(BuildContext context) {
    final double width = AppHelperFunctions.screenWidth();

    bool isDark = AppHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppSizes.sm),
          child: Container(
          
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              border: Border.all(
                  color: isDark
                      ? AppColors.grey.withOpacity(0.4)
                      : AppColors.dark.withOpacity(0.2)),
              color: isDark ? AppColors.dark : AppColors.grey.withOpacity(0.2),
            ),
          
          
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.cardRadiusLg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: width / 2.5,
                      backgroundImage: const AssetImage(AppImages.profileLogo), // Replace with your image
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const PersonProfileDetails(),
                  const SizedBox(height: AppSizes.spaceBtwItems),


                  // about section
                  const UserAboutSection(),
          
                  const SizedBox(
                    height: AppSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // First button
                      AppElevatedIconButton(
                        onPressed: () {},
                        icon: CupertinoIcons.heart_circle,
                        title: AppTexts.likeProfile, // Use the AppTexts constant
                      ),
          
                      // Space between the two buttons
                      // Second button
                      AppElevatedIconButton(
                        onPressed: () {},
                        icon: CupertinoIcons.person_badge_plus,
                        title: AppTexts.addProfile, // Use the AppTexts constant
                      ),
                      AppElevatedIconButton(
                        onPressed: () {},
                        icon: CupertinoIcons.profile_circled,
                        title: AppTexts.viewProfile, // Use the AppTexts constant
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Positioned(
        //    child: ,
        //
        //
        // ),
        // Positioned(
        //
        //
        // )
      ],
    );
  }
}
