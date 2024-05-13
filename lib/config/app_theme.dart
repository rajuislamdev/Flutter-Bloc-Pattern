import 'package:bloc_practice/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.offWhite,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.purple,
      foregroundColor: AppColors.purple,
      surfaceTintColor: AppColors.purple,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.purple,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.purple,
      foregroundColor: AppColors.purple,
      surfaceTintColor: AppColors.purple,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
    ),
  );
}
