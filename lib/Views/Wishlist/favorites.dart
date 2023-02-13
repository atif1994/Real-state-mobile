import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Wishlist/wishlist_properties.dart';
import 'package:prologic_29/data/Controllers/wishlist_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
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
                // margin: EdgeInsets.symmetric(vertical: 8),
                child: Obx(
              () => wishlistcontroller.wishloadApiLoad.value
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
                      : wishlistcontroller.idlst.isEmpty
                          ? Column(
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
                                  'No Favorites Yet',
                                  style: AppTextStyles.heading1.copyWith(
                                    fontSize: 21,
                                    color: AppColors.colorblack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Press the -- icon to add listings to your favorites',
                                  style: AppTextStyles.labelSmall.copyWith(
                                    fontSize: 14,
                                    color: AppColors.colorblack,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0.h,
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 11.0.w, right: 11.0.w),
                                    child: CustomButton(
                                      onPressed: () {
                                        Get.to(() => WishlistProperties());
                                      },
                                      text: "Search Properties",
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount: wishlistcontroller
                                  .wishlistResponse.data!.length,
                              itemBuilder: ((context, index) {
                                return Container(
                                  height: 45.0.h,
                                  width: 100.0.w,
                                  decoration: CustomDecorations.mainCon,
                                  margin: EdgeInsets.only(
                                      left: 5.0.w,
                                      right: 5.0.w,
                                      top: index == 0 ? 1.0.h : 2.0.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(children: [
                                        SizedBox(
                                          height: 200,
                                          width: 100.w,

                                          // ignore: prefer_const_constructors
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10)),
                                            child: Image.asset(
                                              AppImageResources.property,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        // Positioned(
                                        //   right: 9,
                                        //   top: 9,
                                        //   child:
                                        //   Obx(() => newsfeedController
                                        //           .idlst
                                        //           .contains(
                                        //               newsfeedController
                                        //                   .newsfeedmodel
                                        //                   .data!
                                        //                   .data![
                                        //                       index]
                                        //                   .id)
                                        //       ? GestureDetector(
                                        //           onTap: () {
                                        //             newsfeedController
                                        //                 .idlst
                                        //                 .remove(newsfeedController
                                        //                     .newsfeedmodel
                                        //                     .data!
                                        //                     .data![
                                        //                         index]
                                        //                     .id);
                                        //             // newsfeedController
                                        //             //     .newsfeedmodel
                                        //             //     .data!
                                        //             //     .data![
                                        //             //         index]
                                        //             //     .isLiked
                                        //             //     .value = false;
                                        //           },
                                        //           child: Container(
                                        //             height: 5.h,
                                        //             width: 10.w,
                                        //             decoration: BoxDecoration(
                                        //                 color: Colors
                                        //                     .white,
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(
                                        //                             7)),
                                        //             child: const Icon(
                                        //               Icons
                                        //                   .favorite_outlined,
                                        //               color: Colors
                                        //                   .amber,
                                        //             ),
                                        //           ),
                                        //         )
                                        //       : GestureDetector(
                                        //           onTap: () async {
                                        //             var box = await Hive
                                        //                 .openBox(
                                        //                     'wishlist');

                                        //             newsfeedController
                                        //                 .idlst
                                        //                 .add(newsfeedController
                                        //                     .newsfeedmodel
                                        //                     .data!
                                        //                     .data![
                                        //                         index]
                                        //                     .id);

                                        //             box.put(
                                        //                 'idlist',
                                        //                 newsfeedController
                                        //                     .idlst);
                                        //             // newsfeedController
                                        //             //     .newsfeedmodel
                                        //             //     .data!
                                        //             //     .data![
                                        //             //         index]
                                        //             //     .isLiked
                                        //             //     .value = true;
                                        //           },
                                        //           child: Container(
                                        //             height: 5.h,
                                        //             width: 10.w,
                                        //             decoration: BoxDecoration(
                                        //                 color: Colors
                                        //                     .white,
                                        //                 borderRadius:
                                        //                     BorderRadius
                                        //                         .circular(
                                        //                             7)),
                                        //             child: const Icon(
                                        //               Icons
                                        //                   .favorite_outline,
                                        //               color: Colors
                                        //                   .amber,
                                        //             ),
                                        //           ))),
                                        // )
                                      ]),
                                      SizedBox(
                                        width: 2.0.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 3.5.h,
                                              width: 22.0.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.appthem,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300)),
                                              child: Center(
                                                  child: Text(
                                                wishlistcontroller
                                                    .wishlistResponse
                                                    .data![index]
                                                    .id
                                                    .toString(),
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorWhite),
                                              )),
                                            ),
                                            Text(
                                                wishlistcontroller
                                                    .wishlistResponse
                                                    .data![index]
                                                    .price
                                                    .toString(),
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 10.sp))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 2.0.w,
                                        ),
                                        child: Text(
                                          wishlistcontroller.wishlistResponse
                                                  .data![index].description ??
                                              '',
                                          style:
                                              AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.0.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 2.0.w),
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.bed,
                                              height: 2.0.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              wishlistcontroller
                                                      .wishlistResponse
                                                      .data![index]
                                                      .numberBedroom ??
                                                  "",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.bath,
                                              height: 2.0.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              wishlistcontroller
                                                      .wishlistResponse
                                                      .data![index]
                                                      .numberBathroom ??
                                                  "",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.plots,
                                              height: 2.0.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              wishlistcontroller
                                                      .wishlistResponse
                                                      .data![index]
                                                      .square ??
                                                  "",
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              AppImageResources.loc,
                                              height: 2.0.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            SizedBox(
                                              width: 40.w,
                                              child: Text(
                                                wishlistcontroller
                                                        .wishlistResponse
                                                        .data![index]
                                                        .location ??
                                                    "",
                                                style: AppTextStyles.labelSmall,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 17.0.w,
                                            ),
                                            Container(
                                              height: 3.5.h,
                                              width: 22.0.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.appthem,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300)),
                                              child: Center(
                                                  child: Text(
                                                "View ",
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorWhite),
                                              )),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })),
            )),
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
