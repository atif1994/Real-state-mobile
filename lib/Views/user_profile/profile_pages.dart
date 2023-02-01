import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:prologic_29/Views/user_profile/chat/chat_screen.dart';
import 'package:prologic_29/Views/user_profile/security/security_screen.dart';
import 'package:prologic_29/Views/user_profile/setting/settings_screen.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/user_profile_controller.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';
import 'propertise/propertise_section.dart';

class ProfilePages extends StatelessWidget {
  var profileController = Get.put(UserProfileController());
  ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => profileController.loadingUserProfile.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 39.0.h,
                      width: 100.0.w,
                      color: AppColors.appthem,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                width: 30.0.w,
                              ),
                              Text('Profile',
                                  style: AppTextStyles.heading1
                                      .copyWith(fontSize: 14.sp)),
                              const SizedBox()
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  height: 35.0.w,
                                  width: 35.0.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(300),
                                      border: Border.all(
                                          color: Colors.white, width: 4)),
                                  child: CircleAvatar(

                                      // backgroundColor: Colors.transparent,

                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                    profileController
                                                .userProfileData.data?.avatar ==
                                            ""
                                        ? "https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4"
                                        : profileController
                                                .userProfileData.data?.avatar ??
                                            '',
                                  ))),
                              SizedBox(
                                height: 2.0.h,
                              ),
                              Column(
                                children: [
                                  Text(
                                      "${profileController.userProfileData.data!.firstName ?? ""} ${profileController.userProfileData.data!.lastName ?? ""}",
                                      style: AppTextStyles.heading1
                                          .copyWith(fontSize: 20.sp)),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Text(
                                      profileController
                                              .userProfileData.data!.phone ??
                                          "",
                                      style: AppTextStyles.heading1
                                          .copyWith(fontSize: 12.sp)),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 6.0.w, right: 6.0.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Icon(
                                          Icons.email,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 3.0.w,
                                        ),
                                        Text(
                                            profileController.userProfileData
                                                    .data!.email ??
                                                "",
                                            style: AppTextStyles.heading1
                                                .copyWith(fontSize: 12.sp)),
                                        const Icon(
                                          Icons.location_city,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 3.0.w,
                                        ),
                                        Text(
                                            profileController.userProfileData
                                                    .data!.address!.city ??
                                                "",
                                            style: AppTextStyles.heading1
                                                .copyWith(fontSize: 12.sp)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 1.0.h, left: 2.0.w, right: 2.0.w),
                      height: 55.0.h,
                      width: 100.0.w,
                      //  color: Colors.red,
                      child: Column(
                        children: [
                          ////////////////////////////////////////////

                          InkWell(
                            onTap: () async {
                              Get.to(
                                  () => SettingsScreen(
                                        getUserProfileResponse:
                                            profileController.userProfileData,
                                      ),
                                  duration: const Duration(milliseconds: 600),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 2.0.h),
                                height: 6.0.h,
                                width: 100.0.w,
                                decoration: CustomDecorations.mainCon,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    const Icon(
                                      Icons.settings,
                                      color: AppColors.appthem,
                                    ),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Text("Settings",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.appthem)),
                                  ],
                                )),
                          ),

                          ////////////////////////////////////////////

                          InkWell(
                            onTap: () {
                              Get.to(() => PropertiseSection(),
                                  duration: const Duration(milliseconds: 600),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 2.0.h),
                                height: 6.0.h,
                                width: 100.0.w,
                                decoration: CustomDecorations.mainCon,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    const Icon(
                                      Icons.landslide,
                                      color: AppColors.appthem,
                                    ),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Text("Propertise",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.appthem)),
                                  ],
                                )),
                          ),

                          ////////////////////////////////////////////

                          // Container(
                          //     margin: EdgeInsets.only(top: 2.0.h),
                          //     height: 6.0.h,
                          //     width: 100.0.w,
                          //     decoration: CustomDecorations.mainCon,
                          //     child: Row(
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         SizedBox(
                          //           width: 3.0.w,
                          //         ),
                          //         const Icon(
                          //           Icons.note_add,
                          //           color: AppColors.appthem,
                          //         ),
                          //         SizedBox(
                          //           width: 6.0.w,
                          //         ),
                          //         Text("Add Property",
                          //             style: AppTextStyles.heading1.copyWith(
                          //                 fontSize: 12.sp, color: AppColors.appthem)),
                          //       ],
                          //     )),

                          ////////////////////////////////////////////

                          InkWell(
                            onTap: () {
                              Get.to(() => SecurityScreen(),
                                  duration: const Duration(milliseconds: 600),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 2.0.h),
                                height: 6.0.h,
                                width: 100.0.w,
                                decoration: CustomDecorations.mainCon,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    const Icon(
                                      Icons.lock,
                                      color: AppColors.appthem,
                                    ),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Text("Security",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.appthem)),
                                  ],
                                )),
                          ),

                          ////////////////////////////////////////////

                          InkWell(
                            onTap: () {
                              Get.to(() => const ChatScreen(),
                                  duration: const Duration(milliseconds: 600),
                                  transition: Transition.rightToLeft);
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 2.0.h),
                                height: 6.0.h,
                                width: 100.0.w,
                                decoration: CustomDecorations.mainCon,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    const Icon(
                                      Icons.chat,
                                      color: AppColors.appthem,
                                    ),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Text("Chat",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.appthem)),
                                  ],
                                )),
                          ),

                          ////////////////////////////////////////////

                          InkWell(
                            onTap: () {
                              Get.off(SignIn());
                            },
                            child: Container(
                                margin: EdgeInsets.only(top: 2.0.h),
                                height: 6.0.h,
                                width: 100.0.w,
                                decoration: CustomDecorations.mainCon,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    const Icon(
                                      Icons.logout,
                                      color: AppColors.appthem,
                                    ),
                                    SizedBox(
                                      width: 6.0.w,
                                    ),
                                    Text("Logout",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontSize: 12.sp,
                                            color: AppColors.appthem)),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ))),
    );
  }
}
