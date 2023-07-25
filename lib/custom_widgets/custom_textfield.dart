// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Function? onChanged;
  final Widget? suffixicon;
  final String? Function(String?)? validate;
  TextEditingController editingController;

  CustomTextField({
    this.hintText,
    this.onChanged,
    this.suffixicon,
    this.validate,
    required this.editingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.0.h,
      child: TextFormField(
        controller: editingController,
        decoration: InputDecoration(
          suffixIcon: suffixicon,
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
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validate,
        onChanged: (val) {
          onChanged;
        },
      ),
    );
  }
}
