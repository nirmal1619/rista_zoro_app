import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/texts.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';

class TermsAndPolicyRow extends StatelessWidget {
  const TermsAndPolicyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
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
