import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/image_strings.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

import '../../View Model/Auth Screen ViewModel/Logout ViewModel/session_handler.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.all(AppSizes.defaultSpace).copyWith(top: 50),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                    color:
                        Get.isDarkMode ? AppColors.grey : AppColors.darkGrey),
                borderRadius:
                    BorderRadius.circular(AppSizes.drawerHeaderBorderRaduis),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.md),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(AppImages.profileList[0]),
                    ),
                    const SizedBox(
                      width: AppSizes.spaceBtwItems,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rakesh nagar",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text("id : u2353722",
                            style: Theme.of(context).textTheme.bodyMedium)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          _buildListTile(context, Iconsax.user, 'View Profile', () {
            // Handle 'View Profile' action
          }),
          _buildListTile(context, Iconsax.edit, 'Edit Profile', () {
            // Handle 'Edit Profile' action
          }),
          _buildListTile(context, Iconsax.settings, 'Your Preferences', () {
            // Handle 'Your Preferences' action
          }),
          _buildListTile(context, Iconsax.star, 'Recommended Matches', () {
            // Handle 'Recommended Matches' action
          }),
          _buildListTile(context, Iconsax.bookmark, 'Shortlisted Profiles', () {
            // Handle 'Shortlisted Profiles' action
          }),
          _buildListTile(context, Iconsax.eye, 'Recently Viewed', () {
            // Handle 'Recently Viewed' action
          }),
          _buildListTile(context, Iconsax.document, 'Received Requests', () {
            // Handle 'Received Requests' action
          }),
          _buildListTile(context, Iconsax.card, 'Membership Plans', () {
            // Handle 'Membership Plans' action
          }),
          _buildListTile(context, Iconsax.arrow_up_1, 'Upgrade Account', () {
            // Handle 'Upgrade Account' action
          }),
          _buildListTile(context, Iconsax.discount_circle, 'Special Offers',
              () {
            // Handle 'Special Offers' action
          }),
          _buildListTile(context, Iconsax.crown, 'Current Plan', () {
            // Handle 'Current Plan' action
          }),
          _buildListTile(context, Iconsax.support, 'Help & Support', () {
            // Handle 'Help & Support' action
          }),
          _buildListTile(context, Iconsax.info_circle, 'Terms & Conditions',
              () {
            // Handle 'Terms & Conditions' action
          }),
          // Add some spacing before the logout button

          _buildListTile(context, Iconsax.logout, 'Logout', () {
            SessionHandler.askedForLogOut(context);
            // Handle 'Logout' action
          }, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, VoidCallback onPressed,
      {Color color = Colors.black}) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: Icon(
              icon,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: title == 'Logout' ? Colors.red : null,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: AppSizes.iconSm,
              ),
              onPressed: onPressed,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
          child: Divider(
            color: Get.isDarkMode ? AppColors.darkGrey : Colors.grey.shade300,
          ),
        ), // Divider between list tiles
      ],
    );
  }
}
