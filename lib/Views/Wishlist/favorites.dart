import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Wishlist/wishlist_properties.dart';
import 'package:prologic_29/data/Controllers/wishlist_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../custom_widgets/custom_button.dart';
import '../../utils/constants/image_resources.dart';

class WishlistPage extends StatelessWidget {
  var wishlistcontroller = Get.put(wishlistController());
  WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.menu),
          backgroundColor: AppColors.appthem,
          title: Text(
            'Favorites and Saved',
            style: AppTextStyles.appbar.copyWith(
              // fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Favorites',
                  style: AppTextStyles.labelSmall.copyWith(
                    // fontSize: 22,
                    color: AppColors.colorWhite,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Saved Searches',
                  style: AppTextStyles.labelSmall.copyWith(
                    // fontSize: 22,
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
                child: Obx(() => wishlistcontroller.wishloadApiLoad.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : wishlistcontroller.errorloadingwishlist.value != ''
                        ? Center(
                            child: Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        wishlistcontroller.getwishlist();
                                      },
                                      icon: const Icon(
                                        Icons.refresh,
                                        color: AppColors.appthem,
                                      )),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Text(wishlistcontroller
                                      .errorloadingwishlist.value),
                                ],
                              ),
                            ),
                          )
// wishlistcontroller.ids == []
//                             ? Column(
//                                 children: [
//                                   SizedBox(
//                                     height: 10.0.h,
//                                   ),
//                                   Image.asset(
//                                     AppImageResources.abt,
//                                     color: AppColors.colorblack,
//                                     height: 20.0.h,
//                                   ),
//                                   SizedBox(
//                                     height: 6.0.h,
//                                   ),
//                                   Text(
//                                     'No Favorites Yet',
//                                     style: AppTextStyles.heading1.copyWith(
//                                       fontSize: 21,
//                                       color: AppColors.colorblack,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 1.h,
//                                   ),
//                                   Text(
//                                     'Press the -- icon to add listings to your favorites',
//                                     style: AppTextStyles.labelSmall.copyWith(
//                                       fontSize: 14,
//                                       color: AppColors.colorblack,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 3.0.h,
//                                   ),
//                                   Center(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 11.0.w, right: 11.0.w),
//                                       child: CustomButton(
//                                         onPressed: () {
//                                           Get.to(() => WishlistProperties());
//                                         },
//                                         text: "Search Properties",
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               )
//                             :

                        : ListView.builder(
                            itemCount: wishlistcontroller
                                .wishlistResponse.data!.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                child: Text(wishlistcontroller
                                        .wishlistResponse.data![index].name ??
                                    ""),
                                margin: EdgeInsets.all(10),
                                height: 10.h,
                                width: 20.w,
                                decoration: BoxDecoration(color: Colors.blue),
                              );
                            })))),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Image.asset(
                    AppImageResources.abt,
                    color: AppColors.colorblack,
                    height: 20.0.h,
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  Text(
                    'No Saved Searches!',
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 21,
                      color: AppColors.colorblack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: 325,
                    child: Text(
                      'Looks like you have not saved any searches yet.You can do so by tapping on the "Save Search" button at the top right of the search results screen and continue your property hunt.',
                      style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 12,
                        color: AppColors.colorblack,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 11.0.w, right: 11.0.w),
                      child: CustomButton(
                        onPressed: () {
                          Get.to(() => WishlistProperties());
                        },
                        text: "Find Properties Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
