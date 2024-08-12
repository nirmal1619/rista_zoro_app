import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View%20Model/Create%20Screen%20ViewModel/create%20screen%20controller/create_profile_controller.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Create%20Profile%20Screen/create_profile_screen.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/app_curved_container.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

class SelectPersonScreen extends StatelessWidget {
  const SelectPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProfileController());
    final isDark = AppHelperFunctions.isDarkMode(context);
    List<IconData> profileOptionIcons = [
      Icons.person, // Yourself
      Icons.male, // Brother
      Icons.female, // Sister
      Icons.woman, // Daughter
      Icons.boy, // Son
      Icons.family_restroom // Relative
    ];
    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Select Person"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.0, // Aspect ratio of the containers
          ),
          itemCount: AppTexts.profileOptions.length, // Number of containers
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.createProfileFor.value =
                    AppTexts.profileOptions[index];
                Get.to(() => CreateProfileScreen());
              },
              child: AppCurvedContainer(
                isBorder: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      profileOptionIcons[index],
                      size: 40,
                      color: isDark ? AppColors.grey : AppColors.darkerGrey,
                    ),
                    Text(AppTexts.profileOptions[index])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
