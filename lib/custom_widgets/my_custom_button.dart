// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

class MyCustomButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final bool isloading;

  const MyCustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.isloading = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 100.0.w,
      // height: 6.0.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themecolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: isloading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                text.toString(),
                style: AppTextStyles.heading1
                    .copyWith(fontWeight: FontWeight.normal, fontSize: 12),
              ),
        onPressed: () {
          print("heloooo ");
          onPressed!();
        },
      ),
    );
  }
}
