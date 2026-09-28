import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

// Все текстовые стили храним тут.
// Размеры шрифта пишем через .sp, чтобы текст подстраивался под экран.
//
// ВАЖНО: пишем "static TextStyle get title =>", а не "static TextStyle title =".
// Статическое поле в Dart вычисляется лениво и ровно ОДИН раз. Если первое
// обращение случится раньше, чем ScreenUtil замерит экран, то 24.sp даст 0,
// и этот ноль запомнится навсегда — весь текст станет невидимым.
// Геттер пересчитывается при каждом обращении, поэтому размер всегда верный.
class AppTextStyles {
  static TextStyle get title => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle get subtitle => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle get body =>
      TextStyle(fontSize: 16.sp, color: AppColors.textPrimary);

  static TextStyle get caption =>
      TextStyle(fontSize: 14.sp, color: AppColors.textSecondary);

  static TextStyle get price => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle get white =>
      TextStyle(fontSize: 16.sp, color: AppColors.white);
}
