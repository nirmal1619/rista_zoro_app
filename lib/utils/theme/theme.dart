import 'package:flutter/material.dart';

import 'custom theme/app_chip_theme.dart';
import 'custom theme/app_text_button_theme.dart';
import 'custom theme/appbar_theme.dart';
import 'custom theme/bottom_sheet_theme.dart';
import 'custom theme/check_box_theme.dart';
import 'custom theme/elevated_button_theme.dart';
import 'custom theme/floatingaction_button_theme.dart';
import 'custom theme/outlined_button_theme.dart';
import 'custom theme/text_filed_theme.dart';
import 'custom theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      chipTheme: AppChipTheme.lightChipTheme,
      appBarTheme: AppAppBarTheme.lightAppbarTheme,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      textButtonTheme: AppTextButtonTheme.lightTextButtonTheme,
      elevatedButtonTheme: AppElevatedButton.lightElevatedTheme,
      checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: AppBottomSheetTheme.lightBottomSheet,
      outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: AppTextFiledTheme.lightInputDecorationTheme,
      floatingActionButtonTheme:
          FloatingActionButtonCustomTheme.lightFloatingActionButtonTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      appBarTheme: AppAppBarTheme.darkAppbarTheme,
      chipTheme: AppChipTheme.darkChipTheme,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButton.darkElevatedTheme,
      textButtonTheme: AppTextButtonTheme.darkTextButtonTheme,
      checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheet,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: AppTextFiledTheme
          .darkInputDecorationTheme, // Assuming you have this defined
      floatingActionButtonTheme:
          FloatingActionButtonCustomTheme.darkFloatingActionButtonTheme);
}
