import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart' as prefix;
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/home_screen_banners.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/home_screen_matches.dart';
import 'package:rista_zoro_app/View/Navigation%20Screens/Screens/Home%20Screen/widget/premium_package_card.dart';
import 'package:rista_zoro_app/common/Drawer/app_drawer.dart';
import 'package:rista_zoro_app/common/widgets/ListBuilder%20Seprator/app_listview_seprator.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../../../common/Appbar/common_app_appbar.dart';
import '../../../../common/widgets/Buttons/app_gradient_button.dart';
import '../../../../utils/constants/texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

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
            onPressed: () {
              //
              //   navigationController.
              // scaffoldKey.currentState?.openDrawer();
            },
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
