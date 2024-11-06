import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  AppColors._();

  static AppColors get i {
    _instance ??= AppColors._();
    return _instance!;
  }

  Color get primary => const Color(0xFF1CB259);
  Color get primaryDark => const Color(0xFF13773C);
  Color get primaryLight => const Color(0xFF2FCE9A);
  Color get secondary => const Color(0xFF20CB65);

  Color get error => const Color(0xFFD32F2F);
  Color get warning => const Color(0xFFFFCC00);
  Color get success => const Color(0xFF00C853);
  Color get info => const Color(0xFF448AFF);

  Color get dark => const Color(0xFF1C1C1E);
  Color get grey => const Color(0xFFA5A6AE);
  Color get light => const Color(0xFFFAFAFA);
}
