import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/property_controllers/propertyby_id_controller.dart';
import '../../utils/constants/app_urls.dart';
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
          title: Text(
              propertybyyidController.propertybyIDmodel.data?.name ?? "",
              style: AppTextStyles.heading1),
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
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          // color: Color.fromARGB(255, 216, 212, 212)
                        ),
                        height: 33.0.h,
                        width: 100.0.w,
                        child: ListView.builder(
                          itemCount: propertybyyidController
                              .propertybyIDmodel.data!.images!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 6, right: 6, top: 10, bottom: 10),
                              child: Container(
                                decoration: CustomDecorations.con2.copyWith(
                                    borderRadius: BorderRadius.circular(15)),
                                height: 25.0.h,
                                width: 85.0.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${AppUrls.baseUrl2}${propertybyyidController.propertybyIDmodel.data!.images![index].toString()}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
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
                              width: 30.0.w,
                              decoration: BoxDecoration(
                                  color: AppColors.appthem,
                                  borderRadius: BorderRadius.circular(300)),

                              child: Center(
                                  child: Text(
                                propertybyyidController
                                        .propertybyIDmodel.data!.type!.name ??
                                    "",
                                style: AppTextStyles.labelSmall
                                    .copyWith(color: AppColors.colorWhite),
                              )),
                              // child: Center(
                              //     child: Text(
                              //   "For sale ",
                              //   style: AppTextStyles.labelSmall
                              //       .copyWith(color: AppColors.colorWhite),
                              // )),
                            ),
                            Flexible(
                              child: Text(
                                  "Rs  ${propertybyyidController.propertybyIDmodel.data!.price ?? ""} PKR",
                                  style: AppTextStyles.heading1.copyWith(
                                      color: AppColors.colorblack,
                                      fontSize: 12.sp)),
                            )
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
                      Container(
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                            child: Text(
                              "Descriptionn: ${propertybyyidController.propertybyIDmodel.data!.description ?? ""}",
                              style: AppTextStyles.labelSmall.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                          ),
                        ]),
                      ),

                      Column(
                        children: [
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                              child: Text(
                                "Sector and Block Name : ${propertybyyidController.propertybyIDmodel.data!.sectorAndBlockName ?? ""}",
                                // textAlign: TextAlign.start,
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                            ),
                          ]),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                              child: Text(
                                "Street Number : ${propertybyyidController.propertybyIDmodel.data!.streetNumber ?? ""}",
                                // textAlign: TextAlign.start,
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                            ),
                          ]),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                              child: Text(
                                "Plot Number : ${propertybyyidController.propertybyIDmodel.data!.plotNumber ?? ""}",
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                            ),
                          ]),
                          Row(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                              child: Text(
                                "Floor Number : ${propertybyyidController.propertybyIDmodel.data!.numberFloor ?? ""}",
                                style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.colorblack,
                                ),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 3.0.w),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
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
                              propertybyyidController
                                      .propertybyIDmodel.data!.numberBedroom ??
                                  "",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                            // Text(
                            //   "3 beds",
                            //   style: AppTextStyles.labelSmall
                            //       .copyWith(fontSize: 11.sp),
                            // ),
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
                              propertybyyidController
                                      .propertybyIDmodel.data!.numberBathroom ??
                                  "",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
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
                              propertybyyidController
                                      .propertybyIDmodel.data!.square ??
                                  "",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Row(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 0.5.h, left: 4.0.w),
                          child: Text(
                            'Date Posted : ',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.colorblack,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 0.5.h,
                          ),
                          child: Text(
                            DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                propertybyyidController
                                    .propertybyIDmodel.data!.category!.createdAt
                                    .toString())),
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.colorblack,
                            ),
                          ),
                        ),
                      ]),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 0.6.h, left: 4.0.w, right: 1.6.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImageResources.loc,
                              height: 3.0.h,
                            ),
                            SizedBox(
                              width: 1.0.w,
                            ),
                            Text(
                              propertybyyidController
                                      .propertybyIDmodel.data!.location ??
                                  "",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                            Text(
                              " , ${propertybyyidController.propertybyIDmodel.data!.city!.name ?? ""}",
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )));
  }
}

// DateFormat("dd-MM-yyyy").format(DateTime.parse(
//                                 propertybyyidController
//                                     .propertybyIDmodel.data!.city!.createdAt
//                                     .toString())),


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