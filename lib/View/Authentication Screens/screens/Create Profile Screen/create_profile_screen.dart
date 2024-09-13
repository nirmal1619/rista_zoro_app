import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/Authentication%20Screens/screens/Create%20Profile%20Screen/widgets/create_profile_form.dart';
import 'package:rista_zoro_app/View/Authentication%20Screens/screens/Create%20Profile%20Screen/widgets/term_and_policy_row.dart';
import 'package:rista_zoro_app/common/Appbar/common_app_appbar.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';
import '../../../../common/widgets/Buttons/app_elevated_button.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProfileController());
    return Scaffold(
      appBar: CommonAppAppbar(
        leadingIcon: CupertinoIcons.search,
        title: Text(
          AppTexts.createProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("${AppTexts.login} ?"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ///-- form
              const CreateProfileForm(),
              const SizedBox(height: AppSizes.spaceBtwItems),

              const Divider(),

              //term and policy
              const TermsAndPolicyRow(),

              const SizedBox(height: AppSizes.spaceBtwItems),
              Obx(
                () => controller.isLoading.value
                    ? SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Center(
                              child: SizedBox(
                                width: 40,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color: AppColors.light,
                                ),
                              ),
                            )),
                      )
                    : AppElevatedButton(
                        onPressed: () async {
                          await controller.createAccount();

                          // Navigate to CareerDetailsScreen and remove the current screen from the stack
                          // Get.offNamed(AppScreens.careerDetailsScreen);
                        },
                        buttonName: AppTexts.createProfile,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
