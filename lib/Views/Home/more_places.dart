import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class Moreplaces extends StatelessWidget {
  const Moreplaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Properties", style: AppTextStyles.heading1),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              width: 70.0.w,
              alignment: Alignment.center,
              decoration: CustomDecorations.mainCon,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 23.0.h,
                    width: 70.0.w,
                    decoration: const BoxDecoration(
                        //    color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.asset(
                        'assets/pindi.jpg',
                        fit: BoxFit.cover,
                      ),

                      //     Image.asset(
                      //   AppImageResources
                      //       .property,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 3.5.h,
                        width: 22.0.w,
                        decoration: BoxDecoration(
                            color: AppColors.appthem,
                            borderRadius: BorderRadius.circular(300)),
                        child: Center(
                            child: Text(
                          'For Sale',
                          style: AppTextStyles.labelSmall
                              .copyWith(color: AppColors.colorWhite),
                        )),
                      ),
                      Flexible(
                        child: Text("Rs  3999} PKR",
                            style: AppTextStyles.heading1.copyWith(
                                color: AppColors.colorblack, fontSize: 10.sp)),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0.w, top: 1.0.h),
                    child: Text('charles eaton',
                        style: AppTextStyles.heading1.copyWith(
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
                        '5',
                        style:
                            AppTextStyles.labelSmall.copyWith(fontSize: 9.sp),
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
                        '2',
                        style:
                            AppTextStyles.labelSmall.copyWith(fontSize: 9.sp),
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
                        '77',
                        style:
                            AppTextStyles.labelSmall.copyWith(fontSize: 9.sp),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
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
                        'location',
                        style: AppTextStyles.labelSmall,
                      ),
                    ],
                  )
                ],
              )),
        ],
      )),
    );
  }
}
