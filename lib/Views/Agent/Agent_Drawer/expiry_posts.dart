// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/controller/expired_property_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class Expiryppost extends StatelessWidget {
  var expiredpostcontroller = Get.put(ExpiredPropertyController());
  Expiryppost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Expired Post", style: AppTextStyles.heading1),
      ),
      body: Obx(() => expiredpostcontroller.expiredpost.value
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.appthem,
            ))
          : ListView.builder(
              itemCount: expiredpostcontroller.expiredproperties.data!.length,
              itemBuilder: ((context, index) {
                var data = expiredpostcontroller.expiredproperties.data;
                return Container(
                  margin: EdgeInsets.only(
                      top: index == 0 ? 2.0.h : 2.0.h,
                      bottom: index ==
                              expiredpostcontroller
                                      .expiredproperties.data!.length -
                                  1
                          ? 2.0.h
                          : 0.0.h,
                      left: 3.0.w,
                      right: 3.0.w),
                  decoration: CustomDecorations.mainCon,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Sector Block",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "City",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Price",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Total Bedrooms",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Total Bathrooms",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Satus",
                              style: AppTextStyles.appbar.copyWith(
                                  color: AppColors.colorblack,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        //////////////////////////
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 40.0.w,
                              child: Text(
                                data![index].name ?? "",
                                maxLines: 2,
                                style: AppTextStyles.appbar
                                    .copyWith(color: AppColors.colorblack),
                              ),
                            ),
                            Text(
                              data[index].sectorAndBlockName ?? "",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                            Text(
                              data[index].city!.name ?? "",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                            Text(
                              "${data[index].price ?? ""}/PKR",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                            Text(
                              data[index].numberBedroom ?? "",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                            Text(
                              data[index].numberBathroom ?? "",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                            Text(
                              data[index].city!.status ?? "",
                              style: AppTextStyles.appbar
                                  .copyWith(color: AppColors.colorblack),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }))),
    );
  }
}
