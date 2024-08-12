import 'package:flutter/material.dart';

class AppCheckBoxTheme {
  AppCheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  fillColor: WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.selected)) {
  return Colors.blue; // Blue when selected in lighttheme
  } else {
  return Colors.transparent;
  }
  }),
  checkColor: WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.selected)) {
  return Colors.white;
  } else {
  return Colors.black;
  }
  }),
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  fillColor: WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.selected)) {
  return Colors.white; // White when selected in dark theme
  } else {
  return Colors.white;
  }
  }),
  checkColor: WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.selected)) {
  return Colors.blue;
  } else {
  return Colors.transparent;
  }
  }),
  );
}