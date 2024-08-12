
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FloatingActionButtonCustomTheme{
  FloatingActionButtonCustomTheme._();

  static const lightFloatingActionButtonTheme=FloatingActionButtonThemeData(
    foregroundColor: AppColors.white,
    backgroundColor: AppColors.primaryColor,
  );
  static const darkFloatingActionButtonTheme=FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
     foregroundColor: AppColors.white

  );
}