import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/profile_security_controller/profile_changepassword_controlller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class SecurityScreen extends StatelessWidget {
  var newPasswardController = TextEditingController();
  var confirmPasswardController = TextEditingController();
  var changepasswordController = Get.put(ChangePasswordController());

  SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Security",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
            height: 38.0.h,
            width: 100.0.w,
            decoration: CustomDecorations.mainCon,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Security",
                    style: AppTextStyles.heading1.copyWith(
                        color: AppColors.appthem,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 1.0.h),
                  child: Text(
                    "New Passward",
                    style: AppTextStyles.heading1.copyWith(
                        color: AppColors.appthem,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.nexaBook),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 1.0.h),
                  child:
                      CustomTextField(editingController: newPasswardController),
                ),

                ////////////////////////////////////////////////////

                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 1.0.h),
                  child: Text(
                    "Confirm Passward",
                    style: AppTextStyles.heading1.copyWith(
                        color: AppColors.appthem,
                        fontSize: 14.sp,
                        fontFamily: AppFonts.nexaBook),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 4.0.w, right: 4.0.w, top: 1.0.h),
                  child: CustomTextField(
                    editingController: confirmPasswardController,
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 2.0.h),
                  child: CustomButton(
                    onPressed: () {
                      if (newPasswardController.text ==
                          confirmPasswardController.text) {
                        changepasswordController
                            .changepassword(confirmPasswardController.text);
                      } else {
                        Fluttertoast.showToast(msg: 'Password is not same');
                        print('not correct');
                      }
                    },
                    text: "Update Passward",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
