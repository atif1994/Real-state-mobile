import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/AboutUs/about_us.dart';

import 'package:prologic_29/Views/blog/blog.dart';

import 'package:prologic_29/Views/area_guide/area_guid.dart';
import 'package:prologic_29/Views/newsFeeed/newsfeed.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../Views/AddProperty/add_property.dart';
import '../Views/ContactUs/contact_us.dart';
import '../Views/Wishlist/favorites.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.appthem,
      child: Column(
        children: [
          Container(
            width: 100.0.w,
            height: 24.0.h,
            color: const Color.fromARGB(255, 53, 56, 61),
            child: Column(
              children: [
                SizedBox(
                  height: 2.0.h,
                ),
                Image.asset(
                  AppImageResources.applogo,
                  height: 14.0.h,
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 6.0.w, right: 6.0.w, top: 1.0.h),
                  height: 5.0.h,
                  width: 100.0.w,
                  decoration: CustomDecorations.con3.copyWith(
                    color: const Color.fromARGB(255, 53, 56, 61),
                  ),
                  child: Center(
                    child: Text(
                      "Login or Create Account",
                      style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.colorWhite, fontSize: 12.sp),
                    ),
                  ),
                )
              ],
            ),
          ),
          // const Divider(
          //   color: AppColors.colorWhite,
          // ),
          SizedBox(
            height: 2.0.h,
          ),
          SizedBox(
            height: 68.0.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: Center(
                      child: ListTile(
                        leading: Image.asset(
                          AppImageResources.home,
                          color: AppColors.colorWhite,
                          height: 3.0.h,
                        ),
                        title: Text(
                          "Home",
                          style: AppTextStyles.heading1
                              .copyWith(color: AppColors.colorWhite),
                        ),
                      ),
                    ),
                  ),
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
                        "Add Propertyy",
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
                        Get.to(() => const Blog());
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
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const AreaGuide());
                      },
                      leading: Image.asset(
                        AppImageResources.areaGuide,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Area Guide",
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
                        Get.to(() => NewsFeed());
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
                      leading: const Icon(
                        Icons.logout,
                        color: AppColors.colorWhite,
                      ),
                      title: Text(
                        "Logout",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
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
