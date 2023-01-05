// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function? onPressed;
  const CustomButton({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appthem,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text ?? "",
          style: AppTextStyles.labelSmall.copyWith(color: AppColors.colorWhite),
        ),
      ),
      onPressed: () {
        onPressed;
      },
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
