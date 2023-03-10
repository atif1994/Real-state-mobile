// import 'package:flutter/material.dart';

// class AllProperty extends StatelessWidget {
//   const AllProperty({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Controllers/property_controllers/my_property_controller.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:sizer/sizer.dart';

// import '../../data/Controllers/my_property_controller.dart';
import 'package:intl/intl.dart';
import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({super.key});

  @override
  State<AllProperty> createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {
  var myPropertiseController = Get.put(MyPropertyController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final testimonialImages = [
    AppImageResources.img1,
    AppImageResources.img2,
    AppImageResources.img3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Properties ', style: AppTextStyles.heading1),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 2.0.h,
          ),
          Obx(() => myPropertiseController.loadingMyPropertise.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ),
                )
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount:
                      myPropertiseController.myPropertiseResponse.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 3.0.w,
                              right: 3.0.w,
                              top: index == 0 ? 1.0.h : 2.0.h),
                          height: 62.0.h,
                          width: 100.0.w,
                          decoration: CustomDecorations.mainCon,
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 28.0.h,
                                    width: 100.w,
                                    // ignore: prefer_const_constructors
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.network(
                                        "${AppUrls.baseUrl2}${myPropertiseController.myPropertiseResponse.data![index].images![index]}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.0.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 3.9.h,
                                          width: 22.1.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.appthem,
                                              borderRadius:
                                                  BorderRadius.circular(300)),
                                          child: Center(
                                              child: Text(
                                            myPropertiseController
                                                    .myPropertiseResponse
                                                    .data![index]
                                                    .type!
                                                    .name ??
                                                '',
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                                    color: AppColors.colorWhite,
                                                    fontSize: 17.5,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          )),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                myPropertiseController
                                                        .myPropertiseResponse
                                                        .data![index]
                                                        .currency
                                                        ?.title ??
                                                    "",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 17)),
                                            const Text(": "),
                                            Text(
                                                myPropertiseController
                                                        .myPropertiseResponse
                                                        .data![index]
                                                        .price ??
                                                    "",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 17)),
                                            Text(
                                                myPropertiseController
                                                        .myPropertiseResponse
                                                        .data![index]
                                                        .currency
                                                        ?.symbol ??
                                                    "",
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack,
                                                        fontSize: 16)),
                                            SizedBox(
                                              width: 1.0.w,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 2.9.w,
                                      top: 0.4.h,
                                    ),
                                    child: Text(
                                      myPropertiseController
                                              .myPropertiseResponse
                                              .data![index]
                                              .name ??
                                          "",
                                      style: AppTextStyles.heading1.copyWith(
                                        color: AppColors.colorblack,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Row(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3.0, left: 0.6),
                                                  child: Text(
                                                    "Description: ${myPropertiseController.myPropertiseResponse.data![index].description ?? ""}",
                                                    style: AppTextStyles.appbar
                                                        .copyWith(
                                                      color:
                                                          AppColors.colorblack,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 24.4.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, left: 8.9),
                                          child: Text(
                                            "Sector and Block name: "
                                            "${myPropertiseController.myPropertiseResponse.data![index].sectorAndBlockName ?? ""}",
                                            style:
                                                AppTextStyles.appbar.copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, left: 8.9),
                                          child: Text(
                                            "Plot No:  ${myPropertiseController.myPropertiseResponse.data![index].plotNumber ?? ""}",
                                            style:
                                                AppTextStyles.appbar.copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, left: 8.9),
                                          child: Text(
                                            "Street No: ${myPropertiseController.myPropertiseResponse.data![index].streetNumber ?? ""}",
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 0.2.w, top: 0.6.h),
                                        child: Row(
                                          // crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 2.9.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.bed,
                                              height: 2.5.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              myPropertiseController
                                                      .myPropertiseResponse
                                                      .data![index]
                                                      .numberBedroom ??
                                                  "",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      fontSize: 12.sp,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.bath,
                                              height: 3.4.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              myPropertiseController
                                                      .myPropertiseResponse
                                                      .data![index]
                                                      .numberBathroom ??
                                                  "",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      fontSize: 12.sp,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Image.asset(
                                              AppImageResources.plots,
                                              height: 2.2.h,
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                            Text(
                                              myPropertiseController
                                                      .myPropertiseResponse
                                                      .data![index]
                                                      .square ??
                                                  "",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      fontSize: 12.sp,
                                                      color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 2.0.w,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Row(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0, left: 8.9),
                                          child: Text(
                                            'Date Posted:',
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 4.0, left: 2.4),
                                          child: Text(
                                            DateFormat("dd-MM-yyyy").format(
                                                DateTime.parse(
                                                    myPropertiseController
                                                        .myPropertiseResponse
                                                        .data![index]
                                                        .createdAt
                                                        .toString())),
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                              color: AppColors.colorblack,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.9, top: 4.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImageResources.loc,
                                              height: 2.2.h,
                                            ),
                                            SizedBox(
                                              width: 1.2.w,
                                            ),
                                            Text(
                                              myPropertiseController
                                                      .myPropertiseResponse
                                                      .data![index]
                                                      .location ??
                                                  "",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                      color:
                                                          AppColors.colorblack,
                                                      fontSize: 17),
                                            ),
                                            Text(
                                              " , ${myPropertiseController.myPropertiseResponse.data![index].city!.name ?? ""}",
                                              style: AppTextStyles.heading1
                                                  .copyWith(
                                                color: AppColors.colorblack,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24.0.w,
                        ),
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
