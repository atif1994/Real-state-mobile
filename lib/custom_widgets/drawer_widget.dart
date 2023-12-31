import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:prologic_29/Agent/views/about_agent.dart';

import 'package:prologic_29/Agent/views/dealer_post/dealer_post.dart';
import 'package:prologic_29/Views/Agent/Agent_Drawer/Shared%20Inventory/agent_shared_inventory.dart';
import 'package:prologic_29/Views/Agent/Agent_Drawer/expiry_posts.dart';
import 'package:prologic_29/Views/Agent/Chat/agentConversation.dart';

import 'package:prologic_29/Views/blog/blog.dart';
import 'package:prologic_29/Views/user_profile/properties%20feed/properties_feed.dart';

import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/fonts.dart';
import 'package:prologic_29/utils/constants/image_resources.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

import '../Agent/views/dealer_page.dart';
import '../Views/AboutUs/about_us.dart';
import '../Views/AddProperty/add_property.dart';
import '../Views/Agent/Agent_Drawer/get_all_referrals.dart';
import '../Views/ContactUs/contact_us.dart';
import '../Views/Notifications/notification_page.dart';
import '../Views/user_profile/profile_pages.dart';
import '../data/Controllers/logout_controller.dart';
import '../data/Controllers/user_profile_section_controller/image_update_controller.dart';

class CustomDrawer extends StatelessWidget {
  String fname;
  String lname;
  String email;
  String loginBaseImage;
  CustomDrawer(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.email,
      required this.loginBaseImage})
      : super(key: key);
  final logoutController = Get.put(LogoutController());
  var updateImageController = Get.put(UpdateImageController());
  @override
  Widget build(BuildContext context) {
    print(" Custom Drawer image login base ****$loginBaseImage*********$email");
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
                        child: loginBaseImage != ''
                            ? Image.network(
                                loginBaseImage,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/user.jpg",
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
                  //Home
                  // SizedBox(
                  //   height: 2.0.h,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                  //   height: 6.0.h,
                  //   width: 100.0.w,
                  //   color: const Color.fromARGB(255, 53, 56, 61),
                  //   child: ListTile(
                  //     onTap: () {
                  //       Get.to(() => const Home(),
                  //           duration: const Duration(milliseconds: 600),
                  //           transition: Transition.rightToLeft);
                  //     },
                  //     leading: const Icon(
                  //       Icons.home,
                  //       color: AppColors.colorWhite,
                  //     ),
                  //     title: Text(
                  //       "Home",
                  //       style: AppTextStyles.heading1
                  //           .copyWith(color: AppColors.colorWhite),
                  //     ),
                  //   ),
                  // ),
                  //properties
                  // SizedBox(
                  //   height: 2.0.h,
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                  //   height: 6.0.h,
                  //   width: 100.0.w,
                  //   color: const Color.fromARGB(255, 53, 56, 61),
                  //   child: ListTile(
                  //     onTap: () {
                  //       Get.to(() => PropertiseSection(),
                  //           duration: const Duration(milliseconds: 600),
                  //           transition: Transition.rightToLeft);
                  //     },
                  //     leading: const Icon(
                  //       Icons.landslide,
                  //       color: AppColors.colorWhite,
                  //     ),
                  //     title: Text(
                  //       "Properties",
                  //       style: AppTextStyles.heading1
                  //           .copyWith(color: AppColors.colorWhite),
                  //     ),
                  //   ),
                  // ),
                  //about us

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
                        Get.to(() => const AboutUs(),
                            duration: const Duration(milliseconds: 600),
                            transition: Transition.rightToLeft);
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
                  //contact us
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
                        Get.to(() => const ContactUs(),
                            duration: const Duration(milliseconds: 600),
                            transition: Transition.rightToLeft);
                      },
                      leading: Image.asset(
                        AppImageResources.contact,
                        color: AppColors.colorWhite,
                        height: 2.0.h,
                      ),
                      title: Text(
                        "Contact Us",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  //properties feed
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
                        Get.to(
                            () => PropertiesFeed(
                                  hide: false,
                                ),
                            duration: const Duration(milliseconds: 600),
                            transition: Transition.rightToLeft);
                      },
                      leading: Image.asset(
                        AppImageResources.newFeed,
                        color: AppColors.colorWhite,
                        height: 2.0.h,
                      ),
                      title: Text(
                        "Properties Feed",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  //add property
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
                  //       Get.to(() => const Property());
                  //     },
                  //     leading: Image.asset(
                  //       AppImageResources.addproperty,
                  //       color: AppColors.colorWhite,
                  //       height: 2.0.h,
                  //     ),
                  //     title: Text(
                  //       "Add Property",
                  //       style: AppTextStyles.heading1
                  //           .copyWith(color: AppColors.colorWhite),
                  //     ),
                  //   ),
                  // ),
                  //prologic blog
                  
                  // SizedBox(
                  //   height: 2.0.h,
                  // ),
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
                      onTap: () async {
                        // Get.to(() => ProfileImageEdit());
                        Get.to(() => ProfilePages(
                              loginBaseImage: loginBaseImage,
                            ));
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
                  // Container(
                  //   margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                  //   height: 6.0.h,
                  //   width: 100.0.w,
                  //   color: const Color.fromARGB(255, 53, 56, 61),
                  //   child: ListTile(
                  //     onTap: () {
                  //       Get.to(() => WishlistPage());
                  //     },
                  //     leading: Image.asset(
                  //       AppImageResources.wishlistsearches,
                  //       color: AppColors.colorWhite,
                  //       height: 3.0.h,
                  //     ),
                  //     title: Text(
                  //       "Wishlist searches",
                  //       style: AppTextStyles.heading1
                  //           .copyWith(color: AppColors.colorWhite),
                  //     ),
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: 2.0.h,
                  // ),
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
                        "Notifications",
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
                          logoutalert(context);
                        },
                        child: Text(
                          "Logout",
                          style: AppTextStyles.heading1
                              .copyWith(color: AppColors.colorWhite),
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                  //   height: 6.0.h,
                  //   width: 100.0.w,
                  //   color: const Color.fromARGB(255, 53, 56, 61),
                  //   child: ListTile(
                  //     leading: const Icon(
                  //       Icons.logout,
                  //       color: AppColors.colorWhite,
                  //     ),
                  //     title: GestureDetector(
                  //       onTap: () async {
                  //         //signout
                  //         Get.to(const AgentDashboard());
                  //       },
                  //       child: Text(
                  //         "Agent Dashboard",
                  //         style: AppTextStyles.heading1
                  //             .copyWith(color: AppColors.colorWhite),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void logoutalert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Do you want to logout'),
            actions: [
              ButtonBar(children: [
                ElevatedButton(
                    onPressed: () {
                      logoutController.logout();
                    },
                    child: const Text('Confirm')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ])
            ],
          );
        });
  }
}

//------------------------------ Agent Drawer------------------
class AgentDrawer extends StatelessWidget {
  String fname;
  String lname;
  String email;
  String loginBaseImage;
  AgentDrawer(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.email,
      required this.loginBaseImage})
      : super(key: key);
  final logoutController = Get.put(LogoutController());
  var updateImageController = Get.put(UpdateImageController());
  @override
  Widget build(BuildContext context) {
    print(" Custom Drawer image login base ****$loginBaseImage*********$email");
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
                        child: loginBaseImage != ''
                            ? Image.network(
                                loginBaseImage,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/user.png",
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
                        Get.to(() => const AboutAgent());
                      },
                      leading: Image.asset(
                        AppImageResources.aboutUs,
                        color: AppColors.colorWhite,
                        height: 2.0.h,
                      ),
                      title: Text(
                        "About",
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
                        Get.to(() => const DealerPageUI());
                      },
                      leading: Image.asset(
                        AppImageResources.blogger,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Dealer Page",
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
                      onTap: () async {
                        Get.to(() => AgentConversationScreen());
                      },
                      leading: const Icon(
                        Icons.chat,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Chat",
                        style: AppTextStyles.heading1
                            .copyWith(color: AppColors.colorWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
//------------sharedInventory
                  Container(
                    margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                    height: 6.0.h,
                    width: 100.0.w,
                    color: const Color.fromARGB(255, 53, 56, 61),
                    child: ListTile(
                      onTap: () async {
                        Get.to(() => AgentSharedInventory());
                      },
                      leading: const Icon(
                        Icons.shape_line_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Shared Inventories",
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
                        Get.to(() => PropertiesFeed(hide: true));
                      },
                      leading: Image.asset(
                        AppImageResources.newFeed,
                        color: AppColors.colorWhite,
                        height: 3.0.h,
                      ),
                      title: Text(
                        "Properties Feed",
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
                      onTap: () async {
                        // Get.to(() => ProfileImageEdit());
                        Get.to(const DealerPostScreen());
                      },
                      leading: const Icon(
                        Icons.post_add,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Add Post",
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
                        Get.to(() => Expiryppost());
                      }),
                      leading: Image.asset(
                        color: AppColors.colorWhite,
                        AppImageResources.expirepost,
                        height: 2.5.h,
                      ),
                      title: Text(
                        "Expired Posts",
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
                        Get.to(() => GetReferral());
                      }),
                      leading: Image.asset(
                        color: AppColors.colorWhite,
                        AppImageResources.referral,
                        height: 2.5.h,
                      ),
                      title: Text(
                        "Referrals",
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
                          logoutalert(context);
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

  void logoutalert(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Do you want to logout'),
            actions: [
              ButtonBar(children: [
                ElevatedButton(
                    onPressed: () {
                      logoutController.logout();
                    },
                    child: const Text('Confirm')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'))
              ])
            ],
          );
        });
  }
}
