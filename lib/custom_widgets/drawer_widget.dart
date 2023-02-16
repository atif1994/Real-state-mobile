import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/AboutUs/about_us.dart';

import 'package:prologic_29/Views/blog/blog.dart';

import 'package:prologic_29/Views/newsFeeed/newsfeed.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Views/AddProperty/add_property.dart';
import '../Views/ContactUs/contact_us.dart';
import '../Views/Notifications/notification_page.dart';
import '../Views/user_profile/profile_pages.dart';
import '../Views/Wishlist/favorites.dart';
import '../data/Controllers/logout_controller.dart';

class CustomDrawer extends StatelessWidget {
  String fname;
  String lname;
  String email;
  String img;
  CustomDrawer(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.email,
      required this.img})
      : super(key: key);
  final logoutController = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    print("***************************$email");
    return Drawer(
      backgroundColor: AppColors.appthem,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.5.w, right: 3.0.w, top: 2.0.h),
                width: 100.0.w,
                height: 29.0.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 3.w, right: 4.w, top: 2.0.h, bottom: 0.5),
                width: 100.0.w,
                height: 28.0.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 53, 56, 61),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3.0.h,
                    ),
                    Container(
                      height: 30.0.w,
                      width: 30.0.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 4),
                          borderRadius: BorderRadius.circular(300)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: img == ""
                            ? Image.network(
                                "https://picsum.photos/200/300",
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                img,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    fname == '' && lname == ''
                        ? Text(
                            "Ahmad khan",
                            style: AppTextStyles.heading1.copyWith(
                                fontSize: 16.sp, fontFamily: AppFonts.nexaBold),
                          )
                        : Text(
                            "$fname$lname",
                            style: AppTextStyles.heading1.copyWith(
                                fontSize: 16.sp, fontFamily: AppFonts.nexaBold),
                          ),
                    Text(
                      email,
                      style: AppTextStyles.heading1.copyWith(
                          fontSize: 12.sp, fontFamily: AppFonts.nexaBook),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const Divider(
          //   color: AppColors.colorWhite,
          // ),
          SizedBox(
            height: 1.0.h,
          ),
          SizedBox(
            height: 62.0.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //add property
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const Property());
                      },
                      leading: Image.asset(
                        AppImageResources.addproperty,
                        color: AppColors.colorWhite,
                        height: 2.0.h,
                      ),
                      title: Text(
                        "Add Property",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  //prologic blog
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => Blog());
                      },
                      leading: Image.asset(
                        AppImageResources.blogger,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Prologic Blog",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  //profile

                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        // Get.to(() => ProfileImageEdit());
                        Get.to(ProfilePages());
                      },
                      leading: Image.asset(
                        AppImageResources.profilesetting,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Profile",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),

                  //wishlist
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const WishlistPage());
                      },
                      leading: Image.asset(
                        AppImageResources.wishlistsearches,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Wishlist searches",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const AboutUs());
                      },
                      leading: Image.asset(
                        AppImageResources.aboutUs,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "About Us",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                  //   height: 6.0.h,
                  //   width: 100.0.w,
                  //   color: const Color.fromARGB(255, 53, 56, 61),
                  //   child: ListTile(
                  //     onTap: () {
                  //       Get.to(() => const AreaGuide());
                  //     },
                  //     leading: Image.asset(
                  //       AppImageResources.areaGuide,
                  //       color: AppColors.colorWhite,
                  //       height: 3.0.h,
                  //     ),
                  //     title: Text(
                  //       "Area Guide",
                  //       style: AppTextStyles.heading1
                  //           .copyWith(color: AppColors.colorWhite),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const ContactUs());
                      },
                      leading: Image.asset(
                        AppImageResources.contact,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Contact",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: (() {
                        Get.to(() => const NewsFeed());
                      }),
                      leading: Image.asset(
                        color: AppColors.colorWhite,
                        AppImageResources.newFeed,
                        height: 2.5.h,
                      ),
                      title: Text(
                        "News Feed",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: (() {
                        Get.to(() => AllNotifications());
                      }),
                      leading: Image.asset(
                        color: AppColors.colorWhite,
                        AppImageResources.notificationbell,
                        height: 2.5.h,
                      ),
                      title: Text(
                        "Notification",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 2.0.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: AppColors.colorWhite,
                      ),
                      title: GestureDetector(
                        onTap: () async {
                          //signout
                          logoutController.logout();
                        },
                        child: Text(
                          "Logout",
                          style: AppTextStyles.heading1
                              .copyWith(color: AppColors.colorWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
