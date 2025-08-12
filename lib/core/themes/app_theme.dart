import 'package:flutter/material.dart';
import 'package:uptodo/core/constants/app_colors.dart';

class AppTheme {
  //DARK THEME
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.primaryPurple,

    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColors.primaryPurple,
      onPrimary: AppColors.white,
      secondary: AppColors.primaryPurple,
      onSecondary: AppColors.white,
      surface: AppColors.darkGrey,
      onSurface: AppColors.white,
      background: AppColors.black,
      onBackground: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 23,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        side: const BorderSide(color: AppColors.primaryPurple),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.lightGrey),
      titleLarge: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
    ),

    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),

    dialogTheme: const DialogTheme(
      backgroundColor: AppColors.darkGrey,
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 18),
      contentTextStyle: TextStyle(color: AppColors.white),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.darkGrey,
      modalBackgroundColor: AppColors.darkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
    ),
  );


}