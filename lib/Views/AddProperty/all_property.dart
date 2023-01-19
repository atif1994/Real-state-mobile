// import 'package:flutter/material.dart';

// class AllProperty extends StatelessWidget {
//   const AllProperty({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Controllers/property_controllers/my_property_controller.dart';
import 'package:sizer/sizer.dart';

// import '../../data/Controllers/my_property_controller.dart';

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

          // ListView.builder(itemBuilder: itemBuilder)

          Obx(() => myPropertiseController.loadingMyPropertise.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appthem,
                  ),
                )
              : ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 6,
                  // myPropertiseController.myPropertiseResponse.data!.length,
                  itemBuilder: (context, index) {
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
                                      child:
                                          // Image.network(
                                          //     myPropertiseController
                                          //         .myPropertiseResponse
                                          //         .data![index]!
                                          //         .images
                                          //         .toString()),
                                          Image.asset(
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
                                            "For sale ",
                                            style: AppTextStyles.labelSmall
                                                .copyWith(
                                                    color:
                                                        AppColors.colorWhite),
                                          )),
                                        ),
                                        Text(
                                          myPropertiseController
                                                  .myPropertiseResponse
                                                  .data![index]!
                                                  .price ??
                                              "",
                                          style:
                                              AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack,
                                          ),
                                        ),
                                        // Text("PKR 160,00000",
                                        //     style: AppTextStyles.heading1
                                        //         .copyWith(
                                        //             color: AppColors.colorblack,
                                        //             fontSize: 10.sp))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 2.0.w,
                                    ),
                                    child: Text(
                                      myPropertiseController
                                              .myPropertiseResponse
                                              .data![index]!
                                              .name ??
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
                                          myPropertiseController
                                                  .myPropertiseResponse
                                                  .data![index]!
                                                  .numberBedroom ??
                                              "",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(fontSize: 9.sp),
                                        ),
                                        // Text(
                                        //   "3 beds",
                                        //   style: AppTextStyles.labelSmall
                                        //       .copyWith(fontSize: 9.sp),
                                        // ),
                                        SizedBox(
                                          width: 2.0.w,
                                        ),
                                        Image.asset(
                                          AppImageResources.bath,
                                          height: 2.4.h,
                                        ),
                                        SizedBox(
                                          width: 2.0.w,
                                        ),
                                        Text(
                                          myPropertiseController
                                                  .myPropertiseResponse
                                                  .data![index]!
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
                                          height: 1.6.h,
                                        ),
                                        SizedBox(
                                          width: 2.0.w,
                                        ),
                                        Text(
                                          myPropertiseController
                                                  .myPropertiseResponse
                                                  .data![index]!
                                                  .square ??
                                              "",
                                          style: AppTextStyles.labelSmall
                                              .copyWith(fontSize: 9.sp),
                                        ),
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
                                          myPropertiseController
                                                  .myPropertiseResponse
                                                  .data![index]!
                                                  .location ??
                                              "",
                                          style:
                                              AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack,
                                          ),
                                        ),
                                        // Text(
                                        //   "Islamabad,Punjab",
                                        //   style: AppTextStyles.labelSmall,
                                        // ),
                                        SizedBox(
                                          width: 42.0.w,
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
