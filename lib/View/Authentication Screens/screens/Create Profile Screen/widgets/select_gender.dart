import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../View Model/Auth Screen ViewModel/Create Screen ViewModel/create screen controller/create_profile_controller.dart';
import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../../utils/constants/sizes.dart';

class GenderSelectionRow extends StatelessWidget {
  const GenderSelectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateProfileController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppCurvedContainer(
            height: 55,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.isMale.value,
                    onChanged: (value) {
                      controller.selectGender(value!);
                    },
                  ),
                ),
                const Text('Male'),
              ],
            ),
          ),
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: AppCurvedContainer(
            height: 55,
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.isFemale.value,
                    onChanged: (value) {
                      controller.selectGender(!value!);
                    },
                  ),
                ),
                const Text('Female'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
