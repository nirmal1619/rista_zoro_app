
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AppChipTheme{
  AppChipTheme._();

  static ChipThemeData lightChipTheme= ChipThemeData(
    disabledColor: Colors.grey.shade400,
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor:AppColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
    checkmarkColor: Colors.white
  );

  static ChipThemeData darkChipTheme= const ChipThemeData(
      disabledColor: AppColors.darkerGrey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor:AppColors.primaryColor,

      padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
      checkmarkColor: Colors.white
  );
}