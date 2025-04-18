import 'package:flutter/material.dart';
import 'package:talabi/core/utils/theme/app_colors.dart';

class AppTheme {
  static ThemeData get mainTheme => ThemeData(
        // scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'OpenSans',
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.grey2,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        //  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      );
}
