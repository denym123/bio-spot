import 'package:flutter/material.dart';
import '../../core.dart';

class ThemeConfig {
  ThemeConfig._();

  static const String title = 'Bio Spot';

  static final theme = ThemeData(
    fontFamily: 'Poppins',
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.i.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.i.primary,
      primary: AppColors.i.primary,
      secondary: AppColors.i.primaryDark,
      error: AppColors.i.error,
    ),
    appBarTheme: AppStyles.i.appBarTheme,
    dividerColor: AppColors.i.dark,
  );
}
