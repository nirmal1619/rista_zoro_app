import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackbar {
  static void successMessage(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.green,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  static void errorMessage(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.red,
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }

  static void warningMessage(String title, String message) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.orange,
      icon: const Icon(Icons.warning, color: Colors.white),
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Icon icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      icon: icon,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
      animationDuration: const Duration(milliseconds: 500),
      overlayBlur: 3.0,
      overlayColor: Colors.black.withOpacity(0.5),
      snackStyle: SnackStyle.FLOATING,
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // Dismiss snackbar on button press
        },
        child: const Text(
          'DISMISS',
          style: TextStyle(color: Colors.white),
        ),
      ),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          // Perform actions when snackbar is closed
        }
      },
    );
  }
}
