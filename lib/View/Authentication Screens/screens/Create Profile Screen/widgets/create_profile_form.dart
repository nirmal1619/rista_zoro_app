import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/View/Authentication%20Screens/screens/Create%20Profile%20Screen/widgets/select_gender.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/extented_able_container.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/validator/validator.dart';

import '../../../../../View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';
import '../../../../../utils/constants/sizes.dart';
import 'date_of_birth.dart';

class CreateProfileForm extends StatelessWidget {
  const CreateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateProfileController>(); // Use

    return Form(
      key: controller.createProfileFormKey.value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name Fields with ExtenedAbleContainer
          Row(
            children: [
              Expanded(
                child: ExtenedAbleContainer(
                  child: TextFormField(
                    validator: AppValidator.validateLName,
                    keyboardType: TextInputType.name,
                    controller: controller.firstNameController,
                    decoration: const InputDecoration(
                      hintText: AppTexts.firstNameHint,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwItems),
              Expanded(
                child: ExtenedAbleContainer(
                  child: TextFormField(
                    validator: AppValidator.validateLName,
                    keyboardType: TextInputType.name,
                    controller: controller.lastNameController,
                    decoration: const InputDecoration(
                      hintText: AppTexts.lastNameHint,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Gender Selection with ExtenedAbleContainer
          //
          //
          const GenderSelectionRow(),
          //
          const SizedBox(height: AppSizes.spaceBtwItems),

          // Date of Birth with ExtenedAbleContainer
          const DateOfBirth(),
//
          const SizedBox(height: AppSizes.spaceBtwItems),
          //
          //

          // Enter Height with ExtendAbleContainer
          ExtenedAbleContainer(
            child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(
                        r'^\d*\.?\d{0,1}'), // Allows numbers with up to one decimal point
                  ),
                ],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: controller.heightController,
                decoration: const InputDecoration(
                  hintText: AppTexts.enterHeightHint,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.height),
                ),
                validator: AppValidator.validateHeight),
          ),

          const SizedBox(height: AppSizes.spaceBtwItems),

          // Mobile Number with ExtenedAbleContainer
          ExtenedAbleContainer(
            child: TextFormField(
              validator: AppValidator.validatePhoneNumber,
              controller: controller.mobileNumberController,
              decoration: const InputDecoration(
                hintText: AppTexts.mobileNumberHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),

          // Email with ExtenedAbleContainer
          ExtenedAbleContainer(
            child: TextFormField(
              validator: AppValidator.validateEmail,
              controller: controller.emailController,
              decoration: const InputDecoration(
                hintText: AppTexts.emailHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),

          // Password with ExtenedAbleContainer
          ExtenedAbleContainer(
            child: Obx(
              () => TextFormField(
                validator: AppValidator.validatePassword,
                controller: controller.passwordController,
                decoration: InputDecoration(
                  hintText: AppTexts.passHint,
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Obx(() => Icon(controller.showPassword.value
                        ? Icons.lock_open_outlined
                        : Icons.lock)),
                  ),
                ),
                obscureText: !controller.showPassword.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
