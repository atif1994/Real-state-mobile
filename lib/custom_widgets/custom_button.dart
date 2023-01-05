// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';

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
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      child: Text(text ?? ""),
      onPressed: () {
        onPressed;
      },
    );
  }
}
