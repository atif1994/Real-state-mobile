// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final bool isloading;
  double? height;
  double? width;
  CustomButton(
      {super.key,
      this.text,
      this.onPressed,
      this.isloading = false,
      this.height,
      this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100.0.w,
      height: height ?? 5.2.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.appthem,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                text.toString(),
                style: AppTextStyles.heading1,
              ),
        onPressed: () {
          print("heloooo ");
          onPressed!();
        },
      ),
    );
  }
}
