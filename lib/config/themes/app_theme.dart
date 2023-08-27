import 'package:doctor_final/core/uitls/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/uitls/app_colors.dart';

class ThemeClass {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor, // header background color
        onPrimary: AppColors.white, // header text color
        onSurface: AppColors.black, // body text color
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: AppColors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          height: AppConstants.weRunOnWeb ? 0.3.sp : 1.1.sp,
          color: AppColors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: AppColors.black,
          fontSize: 28.sp,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: TextStyle(
          color: AppColors.hintColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: const TextStyle(
          color: AppColors.black,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          height: 1.3,
          color: AppColors.primaryColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: AppColors.white,
          fontSize: AppConstants.weRunOnWeb ? 9.sp : 21.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.darkBlack,
      hintColor: AppColors.darkBlack,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor, // header background color
        onPrimary: AppColors.black, // header text color
        onSurface: AppColors.black, // body text color
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.darkBlack,
      splashColor: AppColors.darkBlack,
      highlightColor: AppColors.darkBlack,
      hoverColor: Colors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.darkBlack,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          height: AppConstants.weRunOnWeb ? 0.3.sp : 1.3.sp,
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: const TextStyle(
          color: AppColors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        displayLarge: const TextStyle(
          color: AppColors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: const TextStyle(
          color: AppColors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          height: 1.3,
          color: AppColors.primaryColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: AppColors.white,
          fontSize: AppConstants.weRunOnWeb ? 9.sp : 21.sp,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
