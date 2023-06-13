import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  static TextStyle heading1 = TextStyle(
      fontFamily: AppFonts.nexaBold,
      fontSize: 12.sp,
      color: AppColors.colorWhite);

  ///////////////////////////////////

  static TextStyle labelSmall = TextStyle(
      fontFamily: AppFonts.nexaBook,
      fontSize: 12.sp,
      color: AppColors.colorblack);

  static TextStyle appbar = TextStyle(
      fontFamily: AppFonts.nexaBook,
      fontSize: 12.sp,
      color: AppColors.colorWhite);

  static TextStyle normal = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
      color: AppColors.themecolor);
}
