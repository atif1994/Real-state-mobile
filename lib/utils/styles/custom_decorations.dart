import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';

class CustomDecorations {
  static BoxDecoration con1 = BoxDecoration(
    color: AppColors.colorWhite,
    borderRadius: BorderRadius.circular(300),
  );

  static BoxDecoration con2 =
      BoxDecoration(color: AppColors.colorWhite, boxShadow: [
    BoxShadow(
        blurRadius: 0.5,
        spreadRadius: 0.5,
        color: Colors.grey.withOpacity(0.5),
        offset: const Offset(0, 3))
  ]);

  static BoxDecoration mainCon = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.colorWhite,
      boxShadow: [
        BoxShadow(
            blurRadius: 0.5,
            spreadRadius: 0.5,
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0, 3))
      ]);
}
