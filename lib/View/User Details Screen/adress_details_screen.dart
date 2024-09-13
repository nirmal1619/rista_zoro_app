import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View Model/User Details ViewModel/user_details_controller.dart';
import '../../common/Appbar/common_app_appbar.dart';
import '../../common/Dropdown Search/app_search_builder.dart';
import '../../common/Dropdown Search/dropdown_title_and_icon.dart';
import '../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../common/widgets/Text Formates/app_section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/screen_text_list.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper.dart';
import '../Authentication Screens/screens/Create Profile Screen/widgets/next_button.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDetailsController controller = Get.put(UserDetailsController());
    final isDark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CommonAppAppbar(
        showBackArrow: true,
        title: Text("Address Details"),
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
                    // Country Section
                    const AppSectionHeading(
                      title: "Country",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedCountry =
                                await AppSearchBuilder.showSearchWidget(
                                    context,
                                    ScreenTextList
                                        .countries); // Add more countries as needed
                            if (selectedCountry != null &&
                                selectedCountry.length > 2) {
                              controller.country.value = selectedCountry;
                              controller.isCountrySelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.country.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // State Section
                    const AppSectionHeading(
                      title: "State",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedState =
                                await AppSearchBuilder.showSearchWidget(
                                    context,
                                    ScreenTextList
                                        .indianStates); // Add more states as needed
                            if (selectedState != null &&
                                selectedState.length > 2) {
                              controller.state.value = selectedState;
                              controller.isStateSelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.state.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // City Section
                    const AppSectionHeading(
                      title: "City",
                      subtitle: "",
                    ),
                    Obx(() => InkWell(
                          onTap: () async {
                            final selectedCity =
                                await AppSearchBuilder.showSearchWidget(
                                    context,
                                    ScreenTextList
                                        .rajasthanCities); // Add more cities as needed
                            if (selectedCity != null &&
                                selectedCity.length > 2) {
                              controller.city.value = selectedCity;
                              controller.isCitySelected.value = true;
                            }
                          },
                          child: DropDownTitleAndIcon(
                            title: controller.city.value,
                          ),
                        )),
                    const SizedBox(height: AppSizes.defaultSpace),

                    // Address Visibility Section
                    const AppSectionHeading(
                      title: "Current Address",
                      subtitle: "",
                    ),
                    AppCurvedContainer(
                      height: 55,
                      child: TextFormField(
                        controller: controller.addressController,
                        decoration: const InputDecoration(
                          hintText: "Home Address",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(AppSizes.defaultSpace),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),

                    const SizedBox(height: AppSizes.defaultSpace),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.spaceBtwItems,
            ),
            NextButton(
              onPressed: controller.goToHomeScreen,
            ),
          ],
        ),
      ),
    );
  }
}
