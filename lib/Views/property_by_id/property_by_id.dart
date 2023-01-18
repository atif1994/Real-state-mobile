import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/property_controllers/propertyby_id_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';

class PropertyByID extends StatefulWidget {
  int? id;

  PropertyByID({super.key, this.id});

  @override
  State<PropertyByID> createState() => _PropertyByIDState();
}

class _PropertyByIDState extends State<PropertyByID> {
  final propertybyyidController = Get.put(PropertyByIDController());

  @override
  void initState() {
    propertybyyidController.getPropertyById(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("**********************************************${widget.id}");
    return Scaffold(
        appBar: AppBar(
          title: Text('Property ', style: AppTextStyles.heading1),
          backgroundColor: AppColors.appthem,
        ),
        body: Obx(() => propertybyyidController.loadingPropertyByID.value
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.appthem,
              ))
            : propertybyyidController.errorLoadingPropertyByID.value != ''
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            propertybyyidController.getPropertyById(widget.id!);
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(propertybyyidController
                          .errorLoadingPropertyByID.value),
                    ],
                  ))
                : Column(
                    children: [
                      SizedBox(
                        height: 35.0.h,
                        width: 100.0.w,
                        child: Image.asset(
                          AppImageResources.property,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // )),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 5.0.h,
                              width: 24.0.w,
                              decoration: BoxDecoration(
                                  color: AppColors.appthem,
                                  borderRadius: BorderRadius.circular(300)),
                              child: Center(
                                  child: Text(
                                "For sale ",
                                style: AppTextStyles.labelSmall
                                    .copyWith(color: AppColors.colorWhite),
                              )),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 1.0.h, left: 4.0.w),
                            child: Text(
                              propertybyyidController
                                      .propertybyIDmodel.data!.name ??
                                  "",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                            // child: Text(
                            //   'New Property',
                            //   style: AppTextStyles.labelSmall.copyWith(
                            //     color: AppColors.colorblack,
                            //     fontSize: 13.sp,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 3.0.w),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Image.asset(
                              AppImageResources.bed,
                              height: 3.0.h,
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Text(
                              "3 beds",
                              style: AppTextStyles.labelSmall
                                  .copyWith(fontSize: 11.sp),
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Image.asset(
                              AppImageResources.bath,
                              height: 4.0.h,
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Text(
                              "Bath",
                              style: AppTextStyles.labelSmall
                                  .copyWith(fontSize: 11.sp),
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Image.asset(
                              AppImageResources.plots,
                              height: 3.0.h,
                            ),
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Text(
                              "Area",
                              style: AppTextStyles.labelSmall
                                  .copyWith(fontSize: 11.sp),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 1.0.h, left: 3.0.w, right: 1.6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              AppImageResources.loc,
                              height: 3.0.h,
                            ),
                            SizedBox(
                              width: 1.0.w,
                            ),
                            Text(
                              "Islamabad,Punjab",
                              style: AppTextStyles.labelSmall
                                  .copyWith(fontSize: 13.sp),
                            ),
                            SizedBox(
                              width: 24.0.w,
                            ),
                            Container(
                              height: 5.0.h,
                              width: 24.0.w,
                              decoration: BoxDecoration(
                                  color: AppColors.appthem,
                                  borderRadius: BorderRadius.circular(300)),
                              child: Center(
                                  child: Text(
                                "View ",
                                style: AppTextStyles.labelSmall
                                    .copyWith(color: AppColors.colorWhite),
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  )));
  }
}




// Container(
//             margin: EdgeInsets.only(
//               right: 5.0.w,
//               left: 5.0.w,
//             ),
//             height: 6.0.h,
//             width: 100.w,
//             decoration: CustomDecorations.mainCon,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 4.0.h,
//                   // ),

//                   const Icon(Icons.favorite_border_outlined),
//                   Text(
//                     "Like",
//                     style: AppTextStyles.labelSmall.copyWith(
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 3.0.w,
//                   ),
//                   const Icon(Icons.comment_outlined),
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 4.0.h,
//                   // ),
//                   Text(
//                     "Comment",
//                     style: AppTextStyles.labelSmall,
//                   ),
//                   SizedBox(
//                     width: 3.0.w,
//                   ),
//                   const Icon(Icons.share),
//                   // Image.asset(
//                   //   AppImageResources.bed,
//                   //   height: 3.0.h,
//                   // ),
//                   Text(
//                     "Share",
//                     style: AppTextStyles.labelSmall,
//                   )
//                 ]),
//           ),