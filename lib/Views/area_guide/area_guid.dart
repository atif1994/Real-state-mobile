import 'package:flutter/material.dart';
// import 'package:prologic_29/Views/Drawer/about_us.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/image_resources.dart';
import '../AboutUs/about_us.dart';
// import 'package:prologic_29/utils/styles/app_textstyles.dart';

class AreaGuide extends StatelessWidget {
  const AreaGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text('Area Guide', style: AppTextStyles.heading1),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Find By Locations',
                    style: AppTextStyles.heading1.copyWith(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Find your dream home from your dream location',
                    style: AppTextStyles.labelSmall
                        .copyWith(fontSize: 15, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3.0.h,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: 5.0.w, right: 5.0.w, top: index == 0 ? 1.0.h : 2.0.h),
                height: 33.0.h,
                width: 100.0.w,
                decoration: CustomDecorations.mainCon,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                          width: 100.w,
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
                        const SizedBox(
                          width: 28,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'Rawalpindi',
                                      style: AppTextStyles.heading1.copyWith(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                    Text(
                                      '   13 Properties',
                                      style: AppTextStyles.labelSmall.copyWith(
                                          fontSize: 18, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AboutUs()),
                                    );
                                    //Navigator.of(context).pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        // border: Border.all(color: Colors.blue, width: 4),
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Icon(
                                          Icons.arrow_right,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          // const CustomButton(
          //   text: 'Browse More Locations',
          //   onPressed: null,
          // ),
          // SizedBox(
          //   height: 5.0.h,
          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
              child: CustomButton(
                onPressed: () {},
                text: "Brows More Propertiese",
              ),
            ),
          ),
          SizedBox(
            height: 2.0.h,
          ),
          Container(
            // width: 96.0.w,
            margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
            decoration: BoxDecoration(
                color: AppColors.colorblue,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: 2.0.h,
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Explore Good Places',
                          style: AppTextStyles.heading1.copyWith(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(
                          'Find your dream home from your dream location',
                          style: AppTextStyles.heading1
                              .copyWith(fontSize: 15, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
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
                          left: 3.0.w,
                          right: 3.0.w,
                          top: index == 0 ? 1.0.h : 2.0.h),
                      height: 42.0.h,
                      width: 70.0.w,
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
                                        "For sale ",
                                        style: AppTextStyles.labelSmall
                                            .copyWith(
                                                color: AppColors.colorWhite),
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
                                          borderRadius:
                                              BorderRadius.circular(300)),
                                      child: Center(
                                          child: Text(
                                        "View ",
                                        style: AppTextStyles.labelSmall
                                            .copyWith(
                                                color: AppColors.colorWhite),
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
            ),
          ),
        ],
      )),
    );
  }
}
// #242423
