// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Controllers/homefilter_controller.dart';
import 'package:sizer/sizer.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';
import '../Property_by_id/property_by_id.dart';

class FilterPropertyScreen extends StatefulWidget {
  final String cityName;
  const FilterPropertyScreen({super.key, required this.cityName});

  @override
  State<FilterPropertyScreen> createState() => _FilterPropertyScreenState();
}

class _FilterPropertyScreenState extends State<FilterPropertyScreen> {
  final filterpropertiesController = Get.put(FilterPropertiesController());

  int? uid;
  final List<TextEditingController> _controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.cityName, style: AppTextStyles.heading1),
          backgroundColor: AppColors.appthem,
        ),
        body: Obx(() => filterpropertiesController.loadingfilterpost.value
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.appthem,
              ))
            : filterpropertiesController.errorloadingfilterpost.value != ''
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            filterpropertiesController.getfilterproperties;
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(filterpropertiesController
                          .errorloadingfilterpost.value),
                    ],
                  ))
                : filterpropertiesController
                        .propertypostmodel.data!.data!.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/noresultfound.png',
                                scale: 3.4,
                              ),
                              const Text('No Result Found')
                            ],
                          ),
                        ),
                      )
                    : GetBuilder<FilterPropertiesController>(
                        init: FilterPropertiesController(),
                        initState: (_) {},
                        builder: (controller) {
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              _controllers.add(TextEditingController());

                              return Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5.0.w,
                                        right: 5.0.w,
                                        top: index == 0 ? 1.0.h : 2.0.h),
                                    //  height: 45.0.h,
                                    width: 100.0.w,
                                    decoration: CustomDecorations.mainCon,
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
                                                  filterpropertiesController
                                                      .propertypostmodel
                                                      .data!
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
                                                  " ${filterpropertiesController.propertypostmodel.data!.data![index].price}",
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
                                            filterpropertiesController
                                                    .propertypostmodel
                                                    .data!
                                                    .data![index]
                                                    .description ??
                                                "",
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
                                          padding:
                                              EdgeInsets.only(right: 2.0.w),
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
                                                filterpropertiesController
                                                        .propertypostmodel
                                                        .data!
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
                                                filterpropertiesController
                                                        .propertypostmodel
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
                                                filterpropertiesController
                                                        .propertypostmodel
                                                        .data!
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
                                                  filterpropertiesController
                                                          .propertypostmodel
                                                          .data!
                                                          .data![index]
                                                          .location ??
                                                      "",
                                                  style:
                                                      AppTextStyles.labelSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 17.0.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => PropertyByID(
                                                        id: filterpropertiesController
                                                            .propertypostmodel
                                                            .data!
                                                            .data![index]
                                                            .id,
                                                      ));
                                                },
                                                child: Container(
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
                                  SizedBox(
                                    width: 24.0.w,
                                  ),
                                ],
                              );
                            },
                            itemCount: filterpropertiesController
                                .propertypostmodel.data?.data!.length,
                          );
                        })));
  }
}
