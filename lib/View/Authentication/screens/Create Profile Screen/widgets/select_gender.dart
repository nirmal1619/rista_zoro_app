import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';

import '../../../../../common/widgets/Curved Designs/app_curved_container.dart';
import '../../../../../utils/constants/sizes.dart';

class GenderSelectionRow extends StatelessWidget {
  const GenderSelectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppCurvedContainer(
            height: 55,
            child: Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: AppColors.primaryColor,
                  checkColor: AppColors.white,
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
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  activeColor: AppColors.primaryColor,
                  checkColor: AppColors.white,
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
