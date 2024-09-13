import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rista_zoro_app/utils/constants/colors.dart';
import 'package:rista_zoro_app/utils/helpers/helper.dart';

class ShowToast {
  // Generic function to show toast
  static void _showToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
    ToastGravity gravity = ToastGravity.CENTER,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  // Success toast
  static void successMessage(String message, BuildContext context) {
    _showToast(
      message: message,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  static void message(String message, BuildContext context) {
    _showToast(
      message: message,
      backgroundColor: AppHelperFunctions.isDarkMode(context)
          ? AppColors.grey
          : AppColors.dark,
      textColor: Colors.white,
    );
  }

  // Error toast
  static void errorMessage(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  // Warning toast
  static void warningMessage(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
  }

  // Info toast
  static void infoMessage(String message) {
    _showToast(
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }
}
