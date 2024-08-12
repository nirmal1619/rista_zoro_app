import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/app_curved_container.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';
import '../controller/match_screen_slider_controller.dart';


class FloatingAppBarContent extends StatelessWidget {
  const FloatingAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelperFunctions.isDarkMode(context);
    final MatchScreenSliderController pageControllerX = Get.put(MatchScreenSliderController()); // Retrieve the PageControllerX instance

    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? AppColors.grey : AppColors.dark,
          ),
          color: isDark ? AppColors.dark : AppColors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace)
              .copyWith(top: AppSizes.defaultSpace + AppSizes.sm),
          child: Column(
            children: [
              AppCurvedContainer(
                backgroundColor: AppColors.white,
                isBorder: true,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    prefixIcon: Icon(CupertinoIcons.search),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.defaultSpace), // Space between TextField and PageView
              SizedBox(
                height: 150, // Adjust the height of the PageView as needed
                child: PageView(
                  controller: pageControllerX.pageController,
                  children: List.generate(
                    4,
                        (index) => AppCurvedContainer(

                      child: Center(
                        child: Text(
                          'Page ${index + 1}', // Replace with your content
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
