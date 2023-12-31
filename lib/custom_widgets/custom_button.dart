// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  final bool isloading;
  final double? wi;
  final Color? color;

  const CustomButton({
    this.text,
    this.onPressed,
    this.wi = 100.0,
    this.color = AppColors.appthem,
    this.isloading = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wi!.w,
      height: 6.0.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
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

// ignore_for_file: use_key_in_widget_constructors



// import 'package:flutter/material.dart';
// import 'package:prologic_29/utils/constants/appcolors.dart';

// class CustomButton extends StatelessWidget {
//   final String? text;
//   final Function? onPressed;

//   const CustomButton({this.text, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.appthem,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
//       child: Text(text ?? ""),
//       onPressed: () {
//         onPressed;
//       },
//     );
//   }
// }
