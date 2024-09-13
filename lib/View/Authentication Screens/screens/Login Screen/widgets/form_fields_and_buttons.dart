import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../View Model/Auth Screen ViewModel/Login Screen ViewModel/controller/login_controller.dart';
import '../../../../../common/widgets/Buttons/app_elevated_button.dart';
import '../../../../../common/widgets/Curved Designs/extented_able_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper.dart';
import '../../../../../utils/routes/app_screens.dart';
import '../../../../../utils/validator/validator.dart';

class FormFieldsAndButtons extends StatelessWidget {
  const FormFieldsAndButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final isDark = AppHelperFunctions.isDarkMode(context);
    return Form(
      key: loginController.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ExtenedAbleContainer(
              child: TextFormField(
                  controller: loginController.phoneController.value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: Colors.grey),
                    prefixIcon: const Icon(Icons.keyboard),
                    border: const OutlineInputBorder(),
                    enabledBorder: InputBorder.none,
                  ),
                  validator: (value) =>
                      AppValidator.validatePhoneNumber(value)),
            ),

            const SizedBox(height: AppSizes.spaceBtwItems),
            Container(
                constraints: const BoxConstraints(maxHeight: 80, minHeight: 55),
                decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.3),
                    border: Border.all(
                        color: isDark
                            ? AppColors.grey.withOpacity(0.3)
                            : AppColors.dark.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg)),
                child: Obx(
                  () => TextFormField(
                      controller: loginController.passwordController.value,
                      obscureText: loginController.showPassword.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: Colors.grey),
                        prefixIcon: loginController.showPassword.value
                            ? IconButton(
                                onPressed: () =>
                                    loginController.showPassword.value =
                                        !loginController.showPassword.value,
                                icon: const Icon(CupertinoIcons.eye_slash))
                            : IconButton(
                                onPressed: () =>
                                    loginController.showPassword.value =
                                        !loginController.showPassword.value,
                                icon: const Icon(CupertinoIcons.eye)),
                        border: const OutlineInputBorder(),
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) =>
                          AppValidator.validateLoginPassword(value)),
                )),
            const SizedBox(height: AppSizes.spaceBtwItems),

            //login
            AppElevatedButton(
                onPressed: () async {
                  //call login function
                  await loginController.login();
                },
                buttonName: AppTexts.login),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: (value) {
                          loginController.rememberMe.value =
                              !loginController.rememberMe.value;
                        },
                      ),
                    ),
                    const Text(AppTexts.rememberMe),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            AppElevatedButton(
              onPressed: () => Get.toNamed(AppScreens.selectPersonScreen),
              buttonName: AppTexts.createProfile,
            ),
          ],
        ),
      ),
    );
  }
}
