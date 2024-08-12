
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppTextButtonTheme {
  AppTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = const TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>( Colors.transparent),
      foregroundColor: WidgetStatePropertyAll<Color>(AppColors.black),
      overlayColor: WidgetStatePropertyAll<Color>(AppColors.primaryColor)
    ),
  );
  static const TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
      foregroundColor: WidgetStatePropertyAll<Color>(AppColors.white),
        overlayColor: WidgetStatePropertyAll<Color>(AppColors.primaryColor)


    ),
  );
}

