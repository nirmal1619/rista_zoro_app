import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Dropdown%20Search/app_search_builder.dart';

import '../../View Model/User Details ViewModel/user_details_controller.dart';
import '../../common/Appbar/common_app_appbar.dart';
import '../../common/Dropdown Search/dropdown_title_and_icon.dart';
import '../../common/widgets/Text Formates/app_section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/screen_text_list.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper.dart';
import '../Authentication Screens/screens/Create Profile Screen/widgets/next_button.dart';

class SocialDetailsScreen extends StatelessWidget {
  const SocialDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController controller = Get.put(UserDetailsController());
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Social Details"),
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
                    // Marriage Status Section
                    const AppSectionHeading(
                      title: "Marriage Status",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedMaritalStatus =
                                await AppSearchBuilder.showSearchWidget(
                                    context, ScreenTextList.maritalStatus);
                            if (selectedMaritalStatus != null &&
                                selectedMaritalStatus.length > 2) {
                              controller.maritalStatus.value =
                                  selectedMaritalStatus;
                              controller.isMaritalStatusSelected.value = true;
                              if ("Single" != selectedMaritalStatus) {
                                controller.neverMarried.value = false;
                              } else {
                                controller.neverMarried.value = !false;
                              }
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.maritalStatus.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Number of Children Section
                    Obx(() => controller.neverMarried.value
                        ? const SizedBox()
                        : Column(
                            children: [
                              const AppSectionHeading(
                                title: "Number of Children",
                                subtitle: "",
                              ),
                              Obx(() => InkWell(
                                    onTap: () async {
                                      final selectedNumberOfChildren =
                                          await AppSearchBuilder
                                              .showSearchWidget(context,
                                                  ["0", "1", "2", "3+"]);
                                      if (selectedNumberOfChildren != null &&
                                          selectedNumberOfChildren.isNotEmpty) {
                                        controller.numberOfChildren.value =
                                            selectedNumberOfChildren;
                                        controller.isNumberOfChildrenSelected
                                            .value = true;
                                      }
                                    },
                                    child: DropDownTitleAndIcon(
                                      title: controller.numberOfChildren.value,
                                    ),
                                  )),
                              const SizedBox(height: AppSizes.defaultSpace),
                            ],
                          ))

                    // Religion Section
                    ,
                    const AppSectionHeading(
                      title: "Religion",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedReligion =
                                await AppSearchBuilder.showSearchWidget(
                                    context, ScreenTextList.religions);
                            if (selectedReligion != null &&
                                selectedReligion.length > 2) {
                              controller.religion.value = selectedReligion;
                              controller.isReligionSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.religion.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Caste Section

                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedCaste =
                                await AppSearchBuilder.showSearchWidget(context,
                                    ["Brahmin", "Kshatriya", "Vaishya"]);
                            if (selectedCaste != null &&
                                selectedCaste.length > 2) {
                              controller.caste.value = selectedCaste;
                              controller.isCasteSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            // isMust: false,
                            title: controller.caste.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),
                    const AppSectionHeading(
                      title: "Mother Tongues",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedMaritalStatus =
                                await AppSearchBuilder.showSearchWidget(
                                    context, ScreenTextList.motherTongues);
                            if (selectedMaritalStatus != null &&
                                selectedMaritalStatus.length > 2) {
                              controller.motherTongue.value =
                                  selectedMaritalStatus;
                              controller.isMotherTongueSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.motherTongue.value,
                          ),
                        )),

                    const SizedBox(height: AppSizes.defaultSpace),
                    // Manglik Status Section
                    const AppSectionHeading(
                      title: "Manglik",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedManglikStatus =
                                await AppSearchBuilder.showSearchWidget(
                                    context, ["Yes", "No"]);
                            if (selectedManglikStatus != null &&
                                selectedManglikStatus.length > 1) {
                              controller.manglik.value = selectedManglikStatus;
                              controller.isManglikSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.manglik.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    const SizedBox(height: AppSizes.spaceBtwItems),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            NextButton(onPressed: controller.goToFamilyDetails),
          ],
        ),
      ),
    );
  }
}
