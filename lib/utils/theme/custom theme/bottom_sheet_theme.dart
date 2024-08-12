import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  static final BottomSheetThemeData lightBottomSheet = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.white,
      modalBackgroundColor: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)));

  static final BottomSheetThemeData darkBottomSheet = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black, // Dark background
      modalBackgroundColor: Colors.black54, // Slightly transparent dark overlay
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)));
}