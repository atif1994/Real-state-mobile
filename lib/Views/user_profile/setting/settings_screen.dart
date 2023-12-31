// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/Views/user_profile/setting/profile_image.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/profile_updated_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/user_profile_section_controller/image_update_controller.dart';
import '../../../data/Controllers/user_profile_section_controller/user_profile_controller.dart';

class SettingsScreen extends StatefulWidget {
  String? imgulrl;
  SettingsScreen({super.key, this.imgulrl});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var profileController = Get.put(UserProfileController());
  var updateprofileController = Get.put(UpdateProfileController());
  var updateImageController = Get.put(UpdateImageController());

  var fullNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var userNameController = TextEditingController();

  var phoneController = TextEditingController();

  // var userDescController = TextEditingController();

  var emailController = TextEditingController();

  var dobController = TextEditingController();

  var genderController = TextEditingController();
  String formattedDate = DateTime.now().toString();
  String gender = 'Select Gender';

  String? imguploadUrl;
  geUploadtImgUrl() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    imguploadUrl = pref.getString("img");
  }

  @override
  void initState() {
    geUploadtImgUrl();
    userNameController.text =
        profileController.userProfileData.data!.username.toString();
    fullNameController.text =
        "${profileController.userProfileData.data!.firstName} ${profileController.userProfileData.data!.lastName}"
            .toString();
    lastNameController.text =
        profileController.userProfileData.data!.lastName.toString();
    phoneController.text =
        profileController.userProfileData.data!.phone.toString();
    // userDescController.text =
    //     profileController.userProfileData.data!.description.toString();
    emailController.text =
        profileController.userProfileData.data!.email.toString();
    phoneController.text =
        profileController.userProfileData.data!.phone.toString();
    String timestamp = profileController.userProfileData.data!.dob ?? '';
    if (timestamp != '') {
      final DateTime dateTime = DateTime.parse(timestamp);
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      formattedDate = dateFormat.format(dateTime);
    } else {
      final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      formattedDate = dateFormat.format(DateTime.now());
    }
    // dob = DateFormat("dd-MM-yyyy");
    //  (profileController.userProfileData.data!.dob!);

    // profileController.userProfileData.data!.dob.toString();
    gender = profileController.userProfileData.data!.gender.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Settings Screen img url+++++ ${widget.imgulrl}");
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
                            child: Stack(children: <Widget>[
                              GestureDetector(
                                onTap: () => showimage(),
                                child: Hero(
                                  tag: 'Hero1',
                                  child: CircleAvatar(
                                    radius: 90,
                                    // backgroundColor: Colors.transparent,
                                    backgroundImage: CachedNetworkImageProvider(
                                      widget.imgulrl != null
                                          ? "${widget.imgulrl}"
                                          : imguploadUrl.toString(),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: ClipOval(
                                      child: InkWell(
                                    onTap: () {
                                      Get.to(const profileImage());
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 2, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey.shade600,
                                            size: 21,
                                          ),
                                        )),
                                  )))
                            ])),
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
                        "Full Name",
                        style: AppTextStyles.heading1.copyWith(
                            color: AppColors.appthem, fontSize: 12.sp),
                      ),
                    ),

                    CustomTextField(editingController: fullNameController),

                    ////////////////////////////////////////////////////////////

                    // Padding(
                    //   padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                    //   child: Text(
                    //     "Last Name",
                    //     style: AppTextStyles.heading1.copyWith(
                    //         color: AppColors.appthem, fontSize: 12.sp),
                    //   ),
                    // ),

                    // CustomTextField(editingController: lastNameController),

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

                    // Padding(
                    //   padding: EdgeInsets.only(left: 3.0.w, top: 2.0.h),
                    //   child: Text(
                    //     "Short Description",
                    //     style: AppTextStyles.heading1.copyWith(
                    //         color: AppColors.appthem, fontSize: 12.sp),
                    //   ),
                    // ),

                    // CustomTextField(editingController: userDescController),

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
                            child: Text(formattedDate)),
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
            child: Obx(() => updateprofileController.loadingUpdateProfile.value
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ))
                : CustomButton(
                    onPressed: () {
                      updateprofileController.updateUserProfile(
                          fullNameController.text.split(' ')[0],
                          fullNameController.text.split(' ')[1],
                          phoneController.text,
                          userNameController.text,
                          emailController.text,
                          formattedDate,
                          gender);
                    },
                    text: "Save",
                  )),
          )
        ],
      ),
    );
  }

  showimage() {
    showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: Colors.grey,
        builder: (_) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.

                return Hero(
                  tag: 'Hero1',
                  child: InteractiveViewer(
                      child: CachedNetworkImage(
                    imageUrl: widget.imgulrl != null
                        ? "${widget.imgulrl}"
                        : imguploadUrl.toString(),
                  )),
                );
              },
            ),
          );
        });
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
        formattedDate = picked.toString().split(" ")[0];
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
