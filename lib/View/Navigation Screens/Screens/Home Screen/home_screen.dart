import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' as prefix;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/home_screen_banners.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/home_screen_matches.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/premium_package_card.dart';
import 'package:rista_zoro_app/common/Drawer/app_drawer.dart';
import 'package:rista_zoro_app/common/widgets/ListBuilder%20Seprator/app_listview_seprator.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

import '../../../../common/Appbar/common_app_appbar.dart';
import '../../../../common/widgets/Buttons/app_gradient_button.dart';
import '../../../../common/widgets/Card/app_card.dart';
import '../../../../utils/constants/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: CommonAppAppbar(
        leadingIcon: CupertinoIcons.bars,
        leadingOnPressed: () {
          Scaffold.of(context).openDrawer();
        },
        isPadding: true,
        title: const Text(AppTexts.appName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(prefix.Iconsax.filter),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ListView(
          children: [
            /// -- app banners
            const HomeScreenBanners(),
            // Slider Container at the top

            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            //missing details
            MissingCard(),

            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            //upload profile pic
            ProfilePictureUpload(),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            /// matched profile
            const HomeScreenMatches(),

            //
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            ///-- view history
            AppGradientButton(
              onPressed: () {},
              title: "View History",
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),

            ///-- packages
            AppListViewSeparator(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => const PremiumPackagesCard(),
                separatorBuilder: (_, __) => const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                itemCount: 3)
            // Rest of the content
          ],
        ),
      ),
    );
  }
}

class MissingCard extends StatelessWidget {
  const MissingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.xl / 2, vertical: AppSizes.xl / 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularPercentIndicator(
              radius: 60,
              progressColor: AppColors.primaryColor.withOpacity(0.8),
              restartAnimation: true,
              addAutomaticKeepAlive: true,
              lineWidth: 20,
              backgroundColor: Colors.red.shade100,
              percent: 0.6,
              animation: true,
              circularStrokeCap: CircularStrokeCap.round,
              animationDuration: 1500,
              center: Text(
                "60%",
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: AppColors.primaryColor,
                    ),
              ),
            ),
            const SizedBox(width: 16), // Add some spacing between the widgets
            Column(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSizes.spaceBtwItems * 2,
                ),
                Text(
                  "Missing Details",
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: AppColors.primaryColor.withOpacity(0.9),
                      ),
                  textAlign: TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Complete your profile",
                    style: Theme.of(context).textTheme.bodySmall!.apply(
                          color: Theme.of(context).primaryColor,
                        ),
                    textAlign: TextAlign.left,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePictureUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            vertical: AppSizes.spaceBtwItems, horizontal: AppSizes.sm),
        // Padding around the content
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            // Circular avatar placeholder
            CircleAvatar(
              radius: 40.0, // Adjust size as needed
              backgroundColor: Colors.red.shade100, // Light red background
              child: Text(
                'P', // Placeholder text
                style: TextStyle(
                  color: Colors.red, // Red color for text
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            // Positioned add icon
          ],
        ),
        title: Text(
          'Profile Pic is Missing',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 16,
                color: Colors.red, // Red color for the title
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Subtitle text
            Text(
              'Upload Profile Picture',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: Colors.blueAccent),
            ),
            SizedBox(width: 8.0), // Space between text and icon
            // Cupertino upload icon button
          ],
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(
            CupertinoIcons.photo_camera,
            color: Theme.of(context).primaryColor,
            size: 24.0, // Adjust size as needed
          ),
          onPressed: () {
            // Handle upload icon press action
          },
        ),
      ),
    );
  }
}
