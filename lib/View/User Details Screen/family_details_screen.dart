import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/common/Dropdown%20Search/app_search_builder.dart';

import '../../View Model/User Details ViewModel/user_details_controller.dart';
import '../../common/Appbar/common_app_appbar.dart';
import '../../common/Dropdown Search/dropdown_title_and_icon.dart';
import '../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../common/widgets/Text Formates/app_section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper.dart';
import '../Authentication Screens/screens/Create Profile Screen/widgets/next_button.dart';

class FamilyDetailsScreen extends StatelessWidget {
  const FamilyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController controller = Get.put(UserDetailsController());
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Family Details"),
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
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Total Members in Family Section (left as TextFormField)
                    const AppSectionHeading(
                      title: "Total Members in family",
                      subtitle: "",
                    ),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Enter members number!",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Father and Mother Section
                    const AppSectionHeading(
                      title: "Father and Mother",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedParentsStatus =
                                await AppSearchBuilder.showSearchWidget(
                                    context, [
                              "Both Live together",
                              "One Deceased",
                              "Both Deceased",
                              "Both Seprated"
                            ]);
                            if (selectedParentsStatus != null &&
                                selectedParentsStatus.isNotEmpty) {
                              controller.parentsStatus.value =
                                  selectedParentsStatus;
                              controller.isParentsStatusSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.parentsStatus.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Number of Siblings Section
                    const AppSectionHeading(
                      title: "Number of Siblings",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedSiblings =
                                await AppSearchBuilder.showSearchWidget(
                                    context, [
                              "0",
                              "1",
                              "2",
                              "3+",
                            ]);
                            if (selectedSiblings != null &&
                                selectedSiblings.isNotEmpty) {
                              controller.siblings.value = selectedSiblings;
                              controller.isSiblingsSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.siblings.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Family Type Section
                    const AppSectionHeading(
                      title: "Family Type",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedFamilyType =
                                await AppSearchBuilder.showSearchWidget(context,
                                    ["Nuclear Family", "Joint Family"]);
                            if (selectedFamilyType != null &&
                                selectedFamilyType.isNotEmpty) {
                              controller.familyType.value = selectedFamilyType;
                              controller.isFamilyTypeSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.familyType.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    const SizedBox(
                      height: AppSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            NextButton(onPressed: controller.goToAddressDetails),
          ],
        ),
      ),
    );
  }
}
