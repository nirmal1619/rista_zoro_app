import 'package:flutter/material.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/constants/sizes.dart';

class AppDialog {
  // Static method to show the alert dialog
  static void showAlertDialog({
    required BuildContext context,
    required String warningMessage,
    required String firstButtonName,
    required String secondButtonName,
    required VoidCallback onFirstButtonPressed,
    required VoidCallback onSecondButtonPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(AppSizes.defaultSpace),
          title: const Text(
            'Warning',
            style: TextStyle(color: Colors.red),
          ),
          content: Text(
            warningMessage,
          ),
          actions: [
            // First button (e.g., Cancel) with red background
            TextButton(
              onPressed: onFirstButtonPressed,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
              ),
              child: Text(
                firstButtonName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // Second button (e.g., Confirm) with white background
            TextButton(
              onPressed: onSecondButtonPressed,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.grey,
              ),
              child: Text(
                secondButtonName,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  // Static method to show a basic dialog with a message
  static void showSimpleMessageDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(AppSizes.defaultSpace),
          title: Text(
            title,
            style: const TextStyle(color: AppColors.primaryColor),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
