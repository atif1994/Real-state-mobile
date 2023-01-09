import 'package:flutter/material.dart';

// import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/image_resources.dart';
// import '../AboutUs/about_us.dart';
// import 'package:prologic_29/Views/Drawer/about_us.dart';

class Properties extends StatelessWidget {
  const Properties({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Properties Page'),
        backgroundColor: AppColors.appthem,
        title: Text('Properties', style: AppTextStyles.heading1),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 3.0.h,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: 5.0.w, right: 5.0.w, top: index == 0 ? 1.0.h : 2.0.h),
                height: 41.0.h,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 3.5.h,
                                width: 22.0.w,
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
                              Text("PKR 160,00000",
                                  style: AppTextStyles.heading1.copyWith(
                                      color: AppColors.colorblack,
                                      fontSize: 10.sp))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2.0.w,
                          ),
                          child: Text(
                            'New Property',
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
                                "3 beds",
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
                                "Bath",
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
                                "Area",
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
                                "Islamabad,Punjab",
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
                    )
                  ],
                ),
                //
              );
            },
          ),
        ],
      )),
    );
  }
}
