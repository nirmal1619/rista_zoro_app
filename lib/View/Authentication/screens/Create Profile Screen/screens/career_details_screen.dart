import 'package:flutter/material.dart';

import '../../../../../common/Appbar/common_app_appbar.dart';
import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../../common/widgets/Text Formates/app_section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper.dart';
import '../widgets/next_button.dart';

class CareerDetailsScreen extends StatelessWidget {
  const CareerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Career Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: isDark
                      ? AppColors.grey.withOpacity(0.7)
                      : AppColors.darkGrey,
                ),
                borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Education Section
                    const AppSectionHeading(
                      title: "Education",
                      subtitle: "",
                    ),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter your education details",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    // Currently Working At Section
                    const AppSectionHeading(
                      title: "Currently Working At",
                      subtitle: "",
                    ),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Company Name",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Income",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    // Working Experience Section
                    const AppSectionHeading(
                      title: "Working Experience",
                      subtitle: "",
                    ),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter your working experience",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),
                    // Submit Button
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            NextButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
