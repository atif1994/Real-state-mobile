// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function? onChanged;
  TextEditingController editingController;

  CustomTextField({
    this.hintText,
    this.onChanged,
    required this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.0.h,
      child: TextField(
        controller: editingController,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: AppFonts.nexaBook),
            contentPadding: EdgeInsets.only(top: 1.0.h, left: 3.0.w),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.appthem),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: Color.fromARGB(255, 132, 160, 216)),
              borderRadius: BorderRadius.circular(10),
            )),
        onChanged: (val) {
          onChanged;
        },
      ),
    );
  }
}
