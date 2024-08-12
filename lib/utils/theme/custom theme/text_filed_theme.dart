import 'package:flutter/material.dart';

class AppTextFiledTheme{
  AppTextFiledTheme._();

  static InputDecorationTheme lightInputDecorationTheme=InputDecorationTheme(
    // hoverColor: AppColors.black,
    // focusColor: AppColors.black,
    floatingLabelAlignment: FloatingLabelAlignment.center,
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(14)),
  enabledBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1,color: Colors.transparent),

  )  ,
      focusedBorder: OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(width: 1,color: Colors.transparent),),
      errorBorder:  OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),

  ),
    focusedErrorBorder:  OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),

    ),
  );
  static InputDecorationTheme darkInputDecorationTheme=InputDecorationTheme(
errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: Colors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(borderRadius: BorderRadius.circular(12,),),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),

    )  ,
    focusedBorder: OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),),

    errorBorder:  OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),

    ),
    focusedErrorBorder:  OutlineInputBorder(    borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.transparent),

    ),
  );
}