import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.kWhite,
    tabBarTheme: TabBarTheme(
      labelColor: AppColor.kMain_2,
      unselectedLabelColor: AppColor.kMain_2.withOpacity(0.4),
      indicatorColor: AppColor.kMain_2,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColor.kMain_1,
      textTheme: ButtonTextTheme.normal,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.kGrey, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.kGreen, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.kGrey, width: 1)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.kMain_2, width: 1)),
      isDense: false,
      errorStyle: const TextStyle(fontSize: 13, color: AppColor.kMain_2),
      hintStyle: const TextStyle(color: AppColor.kGrey, fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
