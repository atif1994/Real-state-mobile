import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/property_by_id/property_by_id.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/more_places_controller.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class Moreplaces extends StatelessWidget {
  var moreplacescontroller = Get.put(MorePlacesController());
  Moreplaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appthem,
          centerTitle: true,
          title: Text("Properties", style: AppTextStyles.heading1),
        ),
        body: Obx(() => moreplacescontroller.loadingmoreplaces.value
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.appthem,
              ))
            : moreplacescontroller.errorloadingmoreplaces.value != ''
                ? Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            moreplacescontroller.getplacesdata();
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(moreplacescontroller.errorloadingmoreplaces.value),
                    ],
                  )
                : ListView.builder(
                    itemBuilder: ((context, index) {
                      if (index <
                          moreplacescontroller
                              .moreplaceresponse.data!.data!.length) {
                        return Column(
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => PropertyByID(
                                        id: moreplacescontroller
                                            .moreplaceresponse
                                            .data!
                                            .data![index]
                                            .id,
                                      ));
                                },
                                child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 90.0.w,
                                    alignment: Alignment.center,
                                    decoration: CustomDecorations.mainCon,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 24.0.h,
                                          width: 90.0.w,
                                          decoration: const BoxDecoration(
                                              //    color: Colors.red,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              child: moreplacescontroller
                                                          .moreplaceresponse
                                                          .data!
                                                          .data![index]
                                                          .images ==
                                                      null
                                                  ? Image.asset(
                                                      AppImageResources
                                                          .property,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : Image.network(
                                                      '${AppUrls.baseUrl2}${moreplacescontroller.moreplaceresponse.data!.data![index].images!["1"].toString()}',
                                                      fit: BoxFit.cover,
                                                    )

                                              //     Image.asset(
                                              //   AppImageResources.property,
                                              //   fit: BoxFit.cover,
                                              // ),
                                              ),
                                        ),
                                        SizedBox(
                                          height: 1.0.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              height: 3.5.h,
                                              width: 24.0.w,
                                              decoration: BoxDecoration(
                                                  color: AppColors.appthem,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300)),
                                              child: Center(
                                                  child: Text(
                                                moreplacescontroller
                                                    .moreplaceresponse
                                                    .data!
                                                    .data![index]
                                                    .type!
                                                    .name
                                                    .toString(),
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorWhite),
                                              )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                  "Rs  ${moreplacescontroller.moreplaceresponse.data!.data![index].price.toString()} PKR",
                                                  style: AppTextStyles.heading1
                                                      .copyWith(
                                                          color: AppColors
                                                              .colorblack,
                                                          fontSize: 10.sp)),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 2.0.w, top: 1.0.h),
                                          child: Text(
                                              moreplacescontroller
                                                  .moreplaceresponse
                                                  .data!
                                                  .data![index]
                                                  .name
                                                  .toString(),
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                color: AppColors.colorblack,
                                              )),
                                        ),
                                        Row(
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
                                              moreplacescontroller
                                                  .moreplaceresponse
                                                  .data!
                                                  .data![index]
                                                  .numberBedroom
                                                  .toString(),
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
                                              moreplacescontroller
                                                  .moreplaceresponse
                                                  .data!
                                                  .data![index]
                                                  .numberBathroom
                                                  .toString(),
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            const Icon(
                                              Icons.landscape_outlined,
                                            ),
                                            // Image.asset(
                                            //   AppImageResources
                                            //       .plots,
                                            //   height: 2.0.h,
                                            // ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              moreplacescontroller
                                                  .moreplaceresponse
                                                  .data!
                                                  .data![index]
                                                  .square
                                                  .toString(),
                                              style: AppTextStyles.labelSmall
                                                  .copyWith(fontSize: 9.sp),
                                            )
                                          ],
                                        ),
                                        const Divider(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8, left: 5),
                                          child: Row(
                                            children: [
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
                                                moreplacescontroller
                                                    .moreplaceresponse
                                                    .data!
                                                    .data![index]
                                                    .location
                                                    .toString(),
                                                style: AppTextStyles.labelSmall
                                                    .copyWith(fontSize: 11.sp),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        );
                      } else {
                        moreplacescontroller.getplacesdata();
                        print(
                            "pagination call ============${moreplacescontroller.page}");
                        return Padding(
                          padding: EdgeInsets.all(5.h),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    }),
                    itemCount: moreplacescontroller
                            .moreplaceresponse.data!.data!.length +
                        1)));
  }
}
