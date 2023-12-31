import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';

class CustomDecorations {
  static double blurradius = 0.1;
  static double spreadradius = 0.5;
  static Color color = Colors.grey.withOpacity(0.2);

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

  static BoxDecoration homeCon = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.colorWhite,
      boxShadow: [
        BoxShadow(
          blurRadius: blurradius,
          spreadRadius: spreadradius,
          color: color,
          offset: const Offset(3, -2),
        ),
        BoxShadow(
          blurRadius: blurradius,
          spreadRadius: spreadradius,
          color: color,
          offset: const Offset(-3, 2),
        ),
        BoxShadow(
          blurRadius: blurradius,
          spreadRadius: spreadradius,
          color: color,
          offset: const Offset(3, 2),
        ),
        BoxShadow(
          blurRadius: blurradius,
          spreadRadius: spreadradius,
          color: color,
          offset: const Offset(-3, -2),
        )
      ]);

  static BoxDecoration condec = BoxDecoration(
      border: Border.all(color: AppColors.colorGrey),
      borderRadius: BorderRadius.circular(10));

  static BoxDecoration con3 = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColors.colorWhite,
      border: Border.all(color: AppColors.colorWhite));

  static BoxDecoration nuemorphicCon = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: const Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        offset: const Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: const Color(0xFFEFEEEE),
    borderRadius: BorderRadius.circular(12.0),
  );
}
