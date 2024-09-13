import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';

import '../../../../../View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';

class TermsAndPolicyRow extends StatelessWidget {
  const TermsAndPolicyRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<
        CreateProfileController>(); // Use Get.find() instead of Get.put()

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.acceptPolicy.value,
                onChanged: (bool? value) {
                  if (value != null) {
                    controller
                        .toggleAcceptPolicy(); // Correctly toggle policy acceptance
                  }
                },
              ),
            ),
            const Text(
              AppTexts.agreeToTermsAndPolicy,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            TextButton(
              onPressed: () {
                // Add your action here
              },
              child: const Text(
                AppTexts.readMore,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
