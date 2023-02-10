import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:prologic_29/Views/area_guide/properties_areaguide.dart';
import 'package:prologic_29/Views/user_profile/chat/convesation_screen.dart';
import 'package:prologic_29/Views/user_profile/security/security_screen.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';
import '../Wishlist/favorites.dart';

class ProfilePages extends StatelessWidget {
  const ProfilePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 29.0.h,
            decoration: const BoxDecoration(
              color: AppColors.appthem,
              // gradient: LinearGradient(
              //   colors: [Colors.red, Colors.deepOrange.shade300],
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              //   stops: const [0.5, 0.9],
              // ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    // CircleAvatar(
                    //   backgroundColor: Colors.red.shade300,
                    //   minRadius: 35.0,
                    //   child: Icon(
                    //     Icons.call,
                    //     size: 30.0,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 66.0,
                      child: CircleAvatar(
                        radius: 64.0,
                        backgroundImage: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 34.0.w,
                    ),
                    Column(
                      children: [
                        Text('Ali Khan',
                            style:
                                AppTextStyles.heading1.copyWith(fontSize: 30)),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Flutter Developer',
                          style: AppTextStyles.heading1.copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   width: 44.0.w,
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     Get.to(ProfileImageEdit());
                    //   },
                    //   child: const CircleAvatar(
                    //     backgroundColor: Colors.white,
                    //     minRadius: 23.0,
                    //     child: Icon(
                    //       Icons.edit,
                    //       size: 23.0,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Container(
            height: 7.3.h,
            // width: 2.0.w,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(WishlistPage());
              }),
              leading: const Icon(Icons.settings),
              title: Text(
                'Settings',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          Container(
            height: 7.3.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(const Properties());
              }),
              leading: const Icon(Icons.propane_rounded),
              title: Text(
                'Properties',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.3.h,
          ),
          Container(
            height: 7.0.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(WishlistPage());
              }),
              leading: const Icon(Icons.mark_chat_read),
              title: Text(
                'Add Property',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          Container(
            height: 7.3.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(SecurityScreen());
              }),
              leading: const Icon(Icons.lock),
              title: Text(
                'Security',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          Container(
            height: 7.3.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(ChatScreen());
              }),
              leading: const Icon(Icons.chat),
              title: Text(
                'Chat',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          Container(
            height: 7.3.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(SignIn());
              }),
              leading: const Icon(Icons.logout_outlined),
              title: Text(
                'Logout',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          Container(
            height: 7.3.h,
            decoration: CustomDecorations.mainCon.copyWith(
              color: AppColors.colorWhite,
            ),
            child: ListTile(
              onTap: (() {
                Get.to(WishlistPage());
              }),
              leading: const Icon(Icons.logout_outlined),
              title: Text(
                'ddddddddddddddddd',
                style: AppTextStyles.heading1.copyWith(
                  color: AppColors.colorblack,
                  fontSize: 21,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.9.h,
          ),
          // const Text('asjxdbxasjkb'),
        ],
      )),
    );
  }
}
