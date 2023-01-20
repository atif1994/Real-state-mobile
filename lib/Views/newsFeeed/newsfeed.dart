import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/NewsFeed_Controller/newsfeed_controller.dart';
import 'package:sizer/sizer.dart';

import 'package:prologic_29/utils/styles/app_textstyles.dart';

import '../../data/Controllers/post_like_controller/post_like_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/custom_decorations.dart';

class NewsFeed extends StatelessWidget {
  final likeController = Get.put(PostLikeController());
  var newsfeedController = Get.put(NewsFeedController());
  NewsFeed({super.key});
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed ', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 2.0.h,
          ),

          // ListView.builder(itemBuilder: itemBuilder)

          Obx(() => newsfeedController.loadingnewspost.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.appthem,
                ))
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    var islike = likeController.postLikeModel.notdeleted;
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.0.w,
                              right: 5.0.w,
                              top: index == 0 ? 1.0.h : 2.0.h),
                          height: 45.0.h,
                          width: 100.0.w,
                          decoration: CustomDecorations.mainCon,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 100.w,

                                    // ignore: prefer_const_constructors
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.asset(
                                        AppImageResources.property,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
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
                                                  BorderRadius.circular(300)),
                                          child: Center(
                                              child: Text(
                                            newsfeedController.newsfeedmodel
                                                    .data!.data![index].name ??
                                                "",
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                                    color:
                                                        AppColors.colorWhite),
                                          )),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                newsfeedController
                                                        .newsfeedmodel
                                                        .data!
                                                        .data![index]
                                                        .price ??
                                                    "",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 10.sp)),
                                            //         Text(
                                            // newsfeedController.newsfeedmodel
                                            //         .data!.data![index].price ??
                                            //     "",
                                            // style: AppTextStyles.heading1
                                            //     .copyWith(
                                            //         color: AppColors.colorblack,
                                            //         fontSize: 10.sp)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 2.0.w,
                                    ),
                                    child: Text(
                                      newsfeedController.newsfeedmodel.data!
                                              .data![index].description ??
                                          "",
                                      style: AppTextStyles.heading1.copyWith(
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
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                                          newsfeedController.newsfeedmodel.data!
                                                  .data![index].numberBedroom ??
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
                                          newsfeedController
                                                  .newsfeedmodel
                                                  .data!
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
                                          newsfeedController.newsfeedmodel.data!
                                                  .data![index].square ??
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
                                        Text(
                                          newsfeedController.newsfeedmodel.data!
                                                  .data![index].location ??
                                              "",
                                          style: AppTextStyles.labelSmall,
                                        ),
                                        SizedBox(
                                          width: 24.0.w,
                                        ),
                                        Container(
                                          height: 3.5.h,
                                          width: 22.0.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.appthem,
                                              borderRadius:
                                                  BorderRadius.circular(300)),
                                          child: Center(
                                              child: Text(
                                            "View ",
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                                    color:
                                                        AppColors.colorWhite),
                                          )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.0.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 5.0.w,
                              left: 5.0.w,
                              top: index == 0 ? 1.0.h : 2.0.h),
                          height: 6.0.h,
                          width: 100.w,
                          decoration: CustomDecorations.mainCon,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Image.asset(
                                //   AppImageResources.bed,
                                //   height: 4.0.h,
                                // ),
                                IconButton(
                                    onPressed: () {
                                      likeController.getPostLikeCon(
                                          newsfeedController
                                              .newsfeedmodel
                                              .data!
                                              .data![index]
                                              .features![index]
                                              .pivot!
                                              .propertyId,
                                          273);
                                    },
                                    icon: islike == 0
                                        ? const Icon(
                                            Icons.favorite_border,
                                          )
                                        : const Icon(
                                            Icons.favorite_outlined,
                                            color: Colors.red,
                                          )),
                                // const Icon(Icons.favorite_border_outlined),
                                Text(
                                  "Like",
                                  style: AppTextStyles.labelSmall.copyWith(
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.0.w,
                                ),
                                const Icon(Icons.comment_outlined),
                                // Image.asset(
                                //   AppImageResources.bed,
                                //   height: 4.0.h,
                                // ),
                                Text(
                                  "Comment",
                                  style: AppTextStyles.labelSmall,
                                ),
                                SizedBox(
                                  width: 3.0.w,
                                ),
                                const Icon(Icons.share),
                                // Image.asset(
                                //   AppImageResources.bed,
                                //   height: 3.0.h,
                                // ),
                                Text(
                                  "Share",
                                  style: AppTextStyles.labelSmall,
                                )
                              ]),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: 5.0.w,
                              left: 5.0.w,
                              top: index == 0 ? 1.0.h : 2.0.h),
                          height: 6.4.h,
                          width: 100.w,
                          decoration: CustomDecorations.mainCon,
                          child: CustomTextField(
                            editingController: commentController,
                            hintText: 'Write Comment....',
                          ),
                        )
                      ],
                    );
                    ///////////
                  },
                ))
        ],
      )),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:prologic_29/custom_widgets/custom_textfield.dart';
// import 'package:sizer/sizer.dart';

// import 'package:prologic_29/utils/styles/app_textstyles.dart';

// import '../../utils/constants/appcolors.dart';
// import '../../utils/constants/image_resources.dart';
// import '../../utils/styles/custom_decorations.dart';

// class NewsFeed extends StatelessWidget {
//   NewsFeed({super.key});
//   final commentController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News Feed ', style: AppTextStyles.heading1),
//         backgroundColor: AppColors.appthem,
//       ),
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           SizedBox(
//             height: 2.0.h,
//           ),

//           // ListView.builder(itemBuilder: itemBuilder)

//           ListView.builder(
//             primary: false,
//             shrinkWrap: true,
//             itemCount: 10,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(
//                         left: 5.0.w,
//                         right: 5.0.w,
//                         top: index == 0 ? 1.0.h : 2.0.h),
//                     height: 45.0.h,
//                     width: 100.0.w,
//                     decoration: CustomDecorations.mainCon,
//                     child: Stack(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               height: 200.h,
//                               width: 100.w,

//                               // ignore: prefer_const_constructors
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(10),
//                                     topRight: Radius.circular(10)),
//                                 child: Image.asset(
//                                   AppImageResources.property,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 2.0.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(6.0),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     height: 3.5.h,
//                                     width: 22.0.w,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.appthem,
//                                         borderRadius:
//                                             BorderRadius.circular(300)),
//                                     child: Center(
//                                         child: Text(
//                                       "For sale ",
//                                       style: AppTextStyles.labelSmall.copyWith(
//                                           color: AppColors.colorWhite),
//                                     )),
//                                   ),
//                                   Text("PKR 160,00000",
//                                       style: AppTextStyles.heading1.copyWith(
//                                           color: AppColors.colorblack,
//                                           fontSize: 10.sp))
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 left: 2.0.w,
//                               ),
//                               child: Text(
//                                 'New Property',
//                                 style: AppTextStyles.heading1.copyWith(
//                                   color: AppColors.colorblack,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 1.0.h,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(right: 2.0.w),
//                               child: Row(
//                                 // crossAxisAlignment: CrossAxisAlignment.end,
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Image.asset(
//                                     AppImageResources.bed,
//                                     height: 2.0.h,
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Text(
//                                     "3 beds",
//                                     style: AppTextStyles.labelSmall
//                                         .copyWith(fontSize: 9.sp),
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Image.asset(
//                                     AppImageResources.bath,
//                                     height: 2.0.h,
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Text(
//                                     "Bath",
//                                     style: AppTextStyles.labelSmall
//                                         .copyWith(fontSize: 9.sp),
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Image.asset(
//                                     AppImageResources.plots,
//                                     height: 2.0.h,
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Text(
//                                     "Area",
//                                     style: AppTextStyles.labelSmall
//                                         .copyWith(fontSize: 9.sp),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const Divider(),
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Image.asset(
//                                     AppImageResources.loc,
//                                     height: 2.0.h,
//                                   ),
//                                   SizedBox(
//                                     width: 2.0.w,
//                                   ),
//                                   Text(
//                                     "Islamabad,Punjab",
//                                     style: AppTextStyles.labelSmall,
//                                   ),
//                                   SizedBox(
//                                     width: 24.0.w,
//                                   ),
//                                   Container(
//                                     height: 3.5.h,
//                                     width: 22.0.w,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.appthem,
//                                         borderRadius:
//                                             BorderRadius.circular(300)),
//                                     child: Center(
//                                         child: Text(
//                                       "View ",
//                                       style: AppTextStyles.labelSmall.copyWith(
//                                           color: AppColors.colorWhite),
//                                     )),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 24.0.w,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                         right: 5.0.w,
//                         left: 5.0.w,
//                         top: index == 0 ? 1.0.h : 2.0.h),
//                     height: 6.0.h,
//                     width: 100.w,
//                     decoration: CustomDecorations.mainCon,
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           // Image.asset(
//                           //   AppImageResources.bed,
//                           //   height: 4.0.h,
//                           // ),

//                           const Icon(Icons.favorite_border_outlined),
//                           Text(
//                             "Like",
//                             style: AppTextStyles.labelSmall.copyWith(
//                               fontSize: 13.sp,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 3.0.w,
//                           ),
//                           const Icon(Icons.comment_outlined),
//                           // Image.asset(
//                           //   AppImageResources.bed,
//                           //   height: 4.0.h,
//                           // ),
//                           Text(
//                             "Comment",
//                             style: AppTextStyles.labelSmall,
//                           ),
//                           SizedBox(
//                             width: 3.0.w,
//                           ),
//                           const Icon(Icons.share),
//                           // Image.asset(
//                           //   AppImageResources.bed,
//                           //   height: 3.0.h,
//                           // ),
//                           Text(
//                             "Share",
//                             style: AppTextStyles.labelSmall,
//                           )
//                         ]),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                         right: 5.0.w,
//                         left: 5.0.w,
//                         top: index == 0 ? 1.0.h : 2.0.h),
//                     height: 7.0.h,
//                     width: 100.w,
//                     decoration: CustomDecorations.mainCon,
//                     child: CustomTextField(
//                       editingController: commentController,
//                       hintText: 'Write Comment....',
//                     ),
//                   )
//                 ],
//               );
//               ///////////
//             },
//           )
//         ],
//       )),
//     );
//   }
// }
