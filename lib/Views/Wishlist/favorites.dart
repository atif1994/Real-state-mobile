// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';
import '../../data/Controllers/wishlist_controller/add_wishlist_controller.dart';
import '../../utils/constants/image_resources.dart';
import '../Property_by_id/property_by_id.dart';

class WishlistPage extends StatelessWidget {
  WishlistPage({super.key});

  var addwishistcontroller = Get.put(AddWishlistController());

  @override
  Widget build(BuildContext context) {
    // var newsfeedController = Get.put(NewsFeedController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              // leading: const Icon(Icons.menu),
              backgroundColor: AppColors.appthem,
              title: Text(
                'Favorites',
                style: AppTextStyles.appbar.copyWith(
                  // fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )),
          body: Container(
            child: Obx(
              () => addwishistcontroller.getloadwishlist.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.appthem,
                    ))
                  : addwishistcontroller.errorLoadinggetwishlist.value != ''
                      ? Center(
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      addwishistcontroller.getwishlist();
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: AppColors.appthem,
                                    )),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Text(addwishistcontroller
                                    .errorLoadinggetwishlist.value),
                              ],
                            ),
                          ),
                        )
                      : addwishistcontroller.getwishlistmodel.data!.isEmpty
                          ? Center(
                              child: Container(
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
                                    // Center(
                                    //   child: Padding(
                                    //     padding:
                                    //         EdgeInsets.only(left: 11.0.w, right: 11.0.w),
                                    //     child: CustomButton(
                                    //       onPressed: () {
                                    //         Get.to(() => WishlistProperties());
                                    //       },
                                    //       text: "Search Properties",
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: addwishistcontroller
                                  .getwishlistmodel.data!.length,
                              itemBuilder: ((context, index) {
                                return Obx(
                                  () => addwishistcontroller.pid.contains(
                                          addwishistcontroller
                                              .getwishlistmodel.data![index].id)
                                      ? Container(
                                          margin: EdgeInsets.only(
                                              left: 5.0.w,
                                              right: 5.0.w,
                                              top: index == 0 ? 1.0.h : 2.0.h),
                                          //  height: 45.0.h,
                                          width: 100.0.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.colorWhite,
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 0.5,
                                                    spreadRadius: 0.5,
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    offset: const Offset(0, 3))
                                              ]),
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
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                      child: Image.asset(
                                                        AppImageResources
                                                            .property,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    )),
                                                Obx(() => addwishistcontroller
                                                        .pid
                                                        .contains(
                                                            addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .id)
                                                    ? Positioned(
                                                        top: 6,
                                                        right: 8,
                                                        child: GestureDetector(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    27,
                                                                    17,
                                                                    17),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6)),
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5.0),
                                                              child: Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                            ),
                                                          ),
                                                          onTap: () async {
                                                            // addwishistcontroller
                                                            //     .removeFavicon(index);

                                                            addwishistcontroller
                                                                .delwishlist(
                                                                    addwishistcontroller
                                                                        .getwishlistmodel
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                            addwishistcontroller
                                                                .pid
                                                                .remove(addwishistcontroller
                                                                    .getwishlistmodel
                                                                    .data![
                                                                        index]
                                                                    .id);
                                                          },
                                                        ))
                                                    : const SizedBox())
                                              ]),
                                              SizedBox(
                                                width: 2.0.h,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 3.5.h,
                                                      width: 22.0.w,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.appthem,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      300)),
                                                      child: Center(
                                                          child: Text(
                                                        addwishistcontroller
                                                            .getwishlistmodel
                                                            .data![index]
                                                            .id
                                                            .toString(),
                                                        style: AppTextStyles
                                                            .labelSmall
                                                            .copyWith(
                                                                color: AppColors
                                                                    .colorWhite),
                                                      )),
                                                    ),
                                                    Text(
                                                        " ${addwishistcontroller.getwishlistmodel.data![index].price}",
                                                        style: AppTextStyles
                                                            .heading1
                                                            .copyWith(
                                                                color: AppColors
                                                                    .colorblack,
                                                                fontSize:
                                                                    10.sp))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 2.0.w,
                                                ),
                                                child: Text(
                                                  addwishistcontroller
                                                          .getwishlistmodel
                                                          .data![index]
                                                          .description ??
                                                      "",
                                                  style: AppTextStyles.heading1
                                                      .copyWith(
                                                    color: AppColors.colorblack,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.0.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 2.0.w),
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
                                                      addwishistcontroller
                                                              .getwishlistmodel
                                                              .data![index]
                                                              .numberBedroom ??
                                                          "",
                                                      style: AppTextStyles
                                                          .labelSmall
                                                          .copyWith(
                                                              fontSize: 9.sp),
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
                                                      addwishistcontroller
                                                              .getwishlistmodel
                                                              .data![index]
                                                              .numberBathroom ??
                                                          "",
                                                      style: AppTextStyles
                                                          .labelSmall
                                                          .copyWith(
                                                              fontSize: 9.sp),
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
                                                      addwishistcontroller
                                                              .getwishlistmodel
                                                              .data![index]
                                                              .square ??
                                                          "",
                                                      style: AppTextStyles
                                                          .labelSmall
                                                          .copyWith(
                                                              fontSize: 9.sp),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const Divider(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
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
                                                        addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .location ??
                                                            "",
                                                        style: AppTextStyles
                                                            .labelSmall,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 17.0.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(() => PropertyByID(
                                                            id: addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .id));
                                                      },
                                                      child: Container(
                                                        height: 3.5.h,
                                                        width: 22.0.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .appthem,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        300)),
                                                        child: Center(
                                                            child: Text(
                                                          "View ",
                                                          style: AppTextStyles
                                                              .labelSmall
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .colorWhite),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      : Opacity(
                                          opacity: 0.2,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 5.0.w,
                                                right: 5.0.w,
                                                top:
                                                    index == 0 ? 1.0.h : 2.0.h),
                                            //  height: 45.0.h,
                                            width: 100.0.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: AppColors.colorWhite,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 0.5,
                                                      spreadRadius: 0.5,
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      offset:
                                                          const Offset(0, 3))
                                                ]),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Stack(children: [
                                                  SizedBox(
                                                    height: 200,
                                                    width: 100.w,

                                                    // ignore: prefer_const_constructors
                                                    child: Obx(
                                                      () => addwishistcontroller
                                                              .pid
                                                              .contains(
                                                                  addwishistcontroller
                                                                      .getwishlistmodel
                                                                      .data![
                                                                          index]
                                                                      .id)
                                                          ? ClipRRect(
                                                              borderRadius: const BorderRadius
                                                                      .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                              child:
                                                                  Image.asset(
                                                                AppImageResources
                                                                    .property,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )
                                                          : Opacity(
                                                              opacity: 0.2,
                                                              child: ClipRRect(
                                                                borderRadius: const BorderRadius
                                                                        .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10)),
                                                                child:
                                                                    Image.asset(
                                                                  AppImageResources
                                                                      .property,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                    ),
                                                  ),
                                                  Obx(() => addwishistcontroller
                                                          .pid
                                                          .contains(
                                                              addwishistcontroller
                                                                  .getwishlistmodel
                                                                  .data![index]
                                                                  .id)
                                                      ? Positioned(
                                                          top: 6,
                                                          right: 8,
                                                          child:
                                                              GestureDetector(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      27,
                                                                      17,
                                                                      17),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6)),
                                                              child:
                                                                  const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color: Colors
                                                                      .amber,
                                                                ),
                                                              ),
                                                            ),
                                                            onTap: () async {
                                                              // addwishistcontroller
                                                              //     .removeFavicon(index);

                                                              addwishistcontroller.delwishlist(
                                                                  addwishistcontroller
                                                                      .getwishlistmodel
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                              addwishistcontroller
                                                                  .pid
                                                                  .remove(addwishistcontroller
                                                                      .getwishlistmodel
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                            },
                                                          ))
                                                      : const SizedBox())
                                                ]),
                                                SizedBox(
                                                  width: 2.0.h,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 3.5.h,
                                                        width: 22.0.w,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .appthem,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        300)),
                                                        child: Center(
                                                            child: Text(
                                                          addwishistcontroller
                                                              .getwishlistmodel
                                                              .data![index]
                                                              .id
                                                              .toString(),
                                                          style: AppTextStyles
                                                              .labelSmall
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .colorWhite),
                                                        )),
                                                      ),
                                                      Text(
                                                          " ${addwishistcontroller.getwishlistmodel.data![index].price}",
                                                          style: AppTextStyles
                                                              .heading1
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .colorblack,
                                                                  fontSize:
                                                                      10.sp))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 2.0.w,
                                                  ),
                                                  child: Text(
                                                    addwishistcontroller
                                                            .getwishlistmodel
                                                            .data![index]
                                                            .description ??
                                                        "",
                                                    style: AppTextStyles
                                                        .heading1
                                                        .copyWith(
                                                      color:
                                                          AppColors.colorblack,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 1.0.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 2.0.w),
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
                                                        addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .numberBedroom ??
                                                            "",
                                                        style: AppTextStyles
                                                            .labelSmall
                                                            .copyWith(
                                                                fontSize: 9.sp),
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
                                                        addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .numberBathroom ??
                                                            "",
                                                        style: AppTextStyles
                                                            .labelSmall
                                                            .copyWith(
                                                                fontSize: 9.sp),
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
                                                        addwishistcontroller
                                                                .getwishlistmodel
                                                                .data![index]
                                                                .square ??
                                                            "",
                                                        style: AppTextStyles
                                                            .labelSmall
                                                            .copyWith(
                                                                fontSize: 9.sp),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Divider(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
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
                                                          addwishistcontroller
                                                                  .getwishlistmodel
                                                                  .data![index]
                                                                  .location ??
                                                              "",
                                                          style: AppTextStyles
                                                              .labelSmall,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 17.0.w,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 3.5.h,
                                                          width: 22.0.w,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .appthem,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          300)),
                                                          child: Center(
                                                              child: Text(
                                                            "View ",
                                                            style: AppTextStyles
                                                                .labelSmall
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .colorWhite),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                );
                              })),
            ),
          )
          //   bottom: TabBar(
          //     tabs: [
          //       Tab(
          //         child: Text(
          //           'Favorites',
          //           style: AppTextStyles.labelSmall.copyWith(
          //             // fontSize: 22,
          //             color: AppColors.colorWhite,
          //           ),
          //         ),
          //       ),
          //       Tab(
          //         child: Text(
          //           'Saved Searches',
          //           style: AppTextStyles.labelSmall.copyWith(
          //             // fontSize: 22,
          //             color: AppColors.colorWhite,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // body: TabBarView(
          //   children: [
          //     GetWishlist(),
          //     Container(
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             height: 10.0.h,
          //           ),
          //           Image.asset(
          //             AppImageResources.abt,
          //             color: AppColors.colorblack,
          //             height: 20.0.h,
          //           ),
          //           SizedBox(
          //             height: 6.0.h,
          //           ),
          //           Text(
          //             'No Saved Searches!',
          //             style: AppTextStyles.heading1.copyWith(
          //               fontSize: 21,
          //               color: AppColors.colorblack,
          //               fontWeight: FontWeight.w500,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 1.h,
          //           ),
          //           SizedBox(
          //             width: 325,
          //             child: Text(
          //               'Looks like you have not saved any searches yet.You can do so by tapping on the "Save Search" button at the top right of the search results screen and continue your property hunt.',
          //               style: AppTextStyles.labelSmall.copyWith(
          //                 fontSize: 12,
          //                 color: AppColors.colorblack,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 3.0.h,
          //           ),
          //           Center(
          //             child: Padding(
          //               padding: EdgeInsets.only(left: 11.0.w, right: 11.0.w),
          //               child: CustomButton(
          //                 onPressed: () {
          //                   Get.to(() => WishlistProperties());
          //                 },
          //                 text: "Find Properties Now",
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
