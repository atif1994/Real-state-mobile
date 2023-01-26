import 'package:flutter/material.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var userNameController = TextEditingController();

  var phoneController = TextEditingController();

  var userDescController = TextEditingController();

  var emailController = TextEditingController();

  var dobController = TextEditingController();

  String dob = 'Select Dob';
  String gender = 'Select Gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Settings",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
            height: 75.0.h,
            width: 100.0.w,
            decoration: CustomDecorations.mainCon,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 75.0.h,
              width: 100.0.w,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 35.0.w,
                        width: 35.0.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            border:
                                Border.all(color: AppColors.appthem, width: 4)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: ClipOval(
                                child: Image.network(
                                  "https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4",
                                ),
                              )),
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Account Information",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 14.sp),
                      ),
                    ),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "First Name",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: firstNameController),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Last Name",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: lastNameController),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "User Name",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: userNameController),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Phone",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: phoneController),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Short Description",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: phoneController),

                    ////////////////////////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Email",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: emailController),

                    ////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Birthday",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        height: 6.0.h,
                        width: 100.0.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.appthem),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.5.h, left: 2.0.w),
                          child: Text(dob),
                        ),
                      ),
                    ),

                    //////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                      child: Text(
                        "Gender",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    InkWell(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Container(
                        height: 6.0.h,
                        width: 100.0.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.appthem),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.5.h, left: 2.0.w),
                          child: Text(gender),
                        ),
                      ),
                    ),

                    /////////////////////////////////////////////
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
            child: CustomButton(
              onPressed: () {},
              text: "Save",
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        dob = picked.toString();
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            width: 100.0.w,
            height: 15.0.h,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Male";
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 2.0.h, left: 2.0.w, right: 2.0.w),
                    height: 4.0.h,
                    width: 100.0.w,
                    //   color: Colors.red,
                    child: Text(
                      "Male",
                      style: AppTextStyles.heading1
                          .copyWith(fontSize: 13.sp, color: AppColors.appthem),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Female";
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(top: 2.0.h, left: 2.0.w, right: 2.0.w),
                    height: 4.0.h,
                    width: 100.0.w,
                    // color: Colors.red,
                    child: Text(
                      "Female",
                      style: AppTextStyles.heading1
                          .copyWith(fontSize: 13.sp, color: AppColors.appthem),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
