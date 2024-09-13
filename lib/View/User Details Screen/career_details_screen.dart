import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Dropdown%20Search/app_search_builder.dart';
import 'package:rista_zoro_app/common/widgets/Card/app_card.dart';

import '../../View Model/User Details ViewModel/user_details_controller.dart';
import '../../common/Appbar/common_app_appbar.dart';
import '../../common/Dropdown Search/dropdown_title_and_icon.dart';
import '../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../common/widgets/Text Formates/app_section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/screen_text_list.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper.dart';
import '../Authentication Screens/screens/Create Profile Screen/widgets/next_button.dart';

class CareerDetailsScreen extends StatelessWidget {
  const CareerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController controller = Get.put(UserDetailsController());
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CommonAppAppbar(
        title: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace / 1.5),
          child: Text("Career Details"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ListView(
          children: [
            AppCard(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isDark
                        ? AppColors.grey.withOpacity(0.7)
                        : AppColors.darkGrey,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Education Section
                      const AppSectionHeading(
                        title: "Education",
                        subtitle: "",
                      ),
                      Obx(() => InkWell(
                            onTap: () async {
                              final selectedDegree =
                                  await AppSearchBuilder.showSearchWidget(
                                      context, ScreenTextList.degrees);
                              if (selectedDegree != null &&
                                  selectedDegree.length > 2) {
                                controller.isDegreeSelected.value = true;
                                controller.degree.value = selectedDegree;
                              }
                            },
                            child: DropDownTitleAndIcon(
                              title: controller.degree.value,
                            ),
                          )),
                      const SizedBox(height: AppSizes.defaultSpace),

                      // Currently Working At Section
                      const AppSectionHeading(
                        title: "Currently Working At",
                        subtitle: "",
                      ),
                      Obx(() => InkWell(
                            onTap: () async {
                              final selectedSector =
                                  await AppSearchBuilder.showSearchWidget(
                                      context, ScreenTextList.employmentTypes);
                              if (selectedSector != null &&
                                  selectedSector.length > 2) {
                                controller.sector.value = selectedSector;
                                controller.isSectorSelected.value = true;
                              }
                            },
                            child: DropDownTitleAndIcon(
                              title: controller.sector.value,
                            ),
                          )),
                      const SizedBox(height: AppSizes.defaultSpace),

                      Obx(() => InkWell(
                            onTap: () async {
                              final selectedPosition =
                                  await AppSearchBuilder.showSearchWidget(
                                      context, ScreenTextList.positions);
                              if (selectedPosition != null &&
                                  selectedPosition.length > 4) {
                                controller.position.value = selectedPosition;
                                controller.isPositionSelected.value = true;
                              }
                            },
                            child: DropDownTitleAndIcon(
                              title: controller.position.value,
                            ),
                          )),
                      const SizedBox(height: AppSizes.defaultSpace),

                      // Company Name Section

                      AppCurvedContainer(
                        height: 55,
                        backgroundColor: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.defaultSpace / 2),
                          child: TextField(
                            controller: controller.companyController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your company name",
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSizes.defaultSpace),

                      // Income Section
                      const AppSectionHeading(
                        title: "Income",
                        subtitle: "",
                      ),
                      Obx(() => InkWell(
                            onTap: () async {
                              final selectedIncome =
                                  await AppSearchBuilder.showSearchWidget(
                                      context, ScreenTextList.incomeRanges);
                              if (selectedIncome != null &&
                                  selectedIncome.length > 2) {
                                controller.income.value = selectedIncome;
                                controller.isIncomeSelected.value = true;
                              }
                            },
                            child: DropDownTitleAndIcon(
                              title: controller.income.value,
                            ),
                          )),
                      const SizedBox(height: AppSizes.defaultSpace),

                      // Working Experience Section
                      const AppSectionHeading(
                        title: "Working Experience",
                        subtitle: "",
                      ),
                      Obx(() => InkWell(
                            onTap: () async {
                              final selectedExperience =
                                  await AppSearchBuilder.showSearchWidget(
                                      context,
                                      ScreenTextList.workingExperiences);
                              if (selectedExperience != null &&
                                  selectedExperience.length > 2) {
                                controller.isExperienceSelected.value = true;

                                controller.workingExperience.value =
                                    selectedExperience;
                              }
                            },
                            child: DropDownTitleAndIcon(
                              title: controller.workingExperience.value,
                            ),
                          )),
                      const SizedBox(height: AppSizes.defaultSpace),

                      const SizedBox(height: AppSizes.spaceBtwItems),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            NextButton(onPressed: controller.goToSocialDetails),
          ],
        ),
      ),
    );
  }
}
