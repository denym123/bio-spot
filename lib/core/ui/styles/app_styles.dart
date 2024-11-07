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

  InputDecoration get defaultInputDecoration => InputDecoration(
        isDense: true,
        prefixIconColor: Colors.grey,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
          borderSide: BorderSide(
            color: AppColors.i.grey,
          ),
        ),
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(24),
          ScreenUtil().setHeight(18),
          ScreenUtil().setWidth(24),
          ScreenUtil().setHeight(18),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ScreenUtil().radius(8),
          ),
          borderSide: BorderSide(
              width: ScreenUtil().setWidth(2), color: AppColors.i.primary),
        ),
      );
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
              ScreenUtil().radius(12),
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
        foregroundColor: AppColors.i.primaryDark,
      );
}

extension AppStylesExtension on BuildContext {
  AppStyles get styles => AppStyles.i;
}
