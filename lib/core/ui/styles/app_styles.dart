import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ElevatedButtonThemeData get primaryButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 3,
          fixedSize: const Size(double.infinity, 48),
          shadowColor: AppColors.i.grey,
          textStyle: TextStyles.i.bold16,
          backgroundColor: AppColors.i.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(20),
            ),
          ),
        ),
      );

  ElevatedButtonThemeData get hollowButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          textStyle: TextStyles.i.bold16,
          foregroundColor: AppColors.i.primary,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(18)),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: ScreenUtil().setWidth(2),
              color: AppColors.i.primary,
            ),
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(20),
            ),
          ),
        ),
      );

  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.i.primary,
      );
}

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.i;
}
