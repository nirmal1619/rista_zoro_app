import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rista_zoro_app/View/Authentication/screens/Create%20Profile%20Screen/widgets/select_gender.dart';
import 'package:rista_zoro_app/common/widgets/Curved%20Designs/app_curved_container.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../../utils/constants/sizes.dart';
import 'date_of_birth.dart';

class CreateProfileForm extends StatelessWidget {
  CreateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AppCurvedContainer(
                  height: 55,
                  child: TextFormField(
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
                child: AppCurvedContainer(
                  height: 55,
                  child: TextFormField(
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

          // Select Gender
          const GenderSelectionRow(),
          const SizedBox(height: AppSizes.spaceBtwItems),

          // Date of Birth
          DateOfBirth(),

          const SizedBox(height: AppSizes.spaceBtwItems),
          //enter height
          AppCurvedContainer(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: AppTexts.enterHeightHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          // const SizedBox(height: AppSizes.spaceBtwItems),

          // AppCurvedContainer(
          //   height: 55,
          //   child: DropdownButtonFormField<String>(
          //     decoration: const InputDecoration(
          //       hintText: AppTexts.religionHint,
          //       border: InputBorder.none,
          //       prefixIcon: Icon(Icons.account_balance),
          //     ),
          //     items: AppTexts.religions
          //         .map((religion) => DropdownMenuItem(
          //               value: religion,
          //               child: Text(religion),
          //             ))
          //         .toList(),
          //     onChanged: (value) {
          //       // Handle the selection without controller
          //     },
          //   ),
          // ),
          // const SizedBox(height: AppSizes.spaceBtwItems),
          // AppCurvedContainer(
          //   height: 55,
          //   child: DropdownButtonFormField<String>(
          //     decoration: const InputDecoration(
          //       hintText: AppTexts.motherTongueHint,
          //       border: InputBorder.none,
          //       prefixIcon: Icon(Icons.language),
          //     ),
          //     items: AppTexts.motherTongues
          //         .map((tongue) => DropdownMenuItem(
          //               value: tongue,
          //               child: Text(tongue),
          //             ))
          //         .toList(),
          //     onChanged: (value) {
          //       // Handle the selection without controller
          //     },
          //   ),
          // ),
          // const SizedBox(height: AppSizes.spaceBtwItems),
          // AppCurvedContainer(
          //   height: 55,
          //   child: DropdownButtonFormField<String>(
          //     decoration: const InputDecoration(
          //       hintText: AppTexts.countryCodeHint,
          //       border: InputBorder.none,
          //       prefixIcon: Icon(Icons.flag),
          //     ),
          //     items: AppTexts.countryCodes.entries
          //         .map((entry) => DropdownMenuItem(
          //               value: entry.key,
          //               child: Text('${entry.key} (${entry.value})'),
          //             ))
          //         .toList(),
          //     onChanged: (value) {
          //       // Handle the selection without controller
          //     },
          //   ),
          // ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          AppCurvedContainer(
            height: 55,
            child: TextFormField(
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
          AppCurvedContainer(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: AppTexts.emailHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          AppCurvedContainer(
            height: 55,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: AppTexts.passHint,
                border: InputBorder.none,
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}
