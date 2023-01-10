import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog',
          style: AppTextStyles.appbar,
        ),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    // margin: EdgeInsets.only(
                    //   left: 5.0.w,
                    //   right: 5.0.w,
                    // ),
                    height: 25.0.h,
                    width: 100.0.h,

                    child: Image.asset(
                      AppImageResources.propertyblog,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 0.0.h,
          ),
          // Container(
          // decoration: const BoxDecoration(
          //   color: Color.fromARGB(255, 173, 172, 172),
          // ),
          Container(
            // decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                SizedBox(
                  height: 5.0.h,
                ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        // decoration: const BoxDecoration(color: Colors.grey),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 4.0.w,
                                  right: 4.0.w,
                                  top: index == 0 ? 1.0.h : 2.0.h),
                              // decoration: CustomDecorations.mainCon,

                              height: 60.0.h,
                              width: 100.0.w,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.st,
                                children: [
                                  Image.asset(
                                    AppImageResources.property,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: 3.0.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Here are the best 10 marla House Design Ideas',
                                      style: AppTextStyles.labelSmall
                                          .copyWith(fontSize: 16.sp),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CONSTRUCTION',
                                          style: AppTextStyles.labelSmall
                                              .copyWith(
                                                  fontSize: 10.sp,
                                                  color: const Color.fromARGB(
                                                      255, 54, 185, 50)),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          width: 2.h,
                                        ),
                                        Text(
                                          '10 MIN READ',
                                          style:
                                              AppTextStyles.labelSmall.copyWith(
                                            fontSize: 9.sp,
                                            color: Colors.grey,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'Lorem Ipsum is simply dummy text of the print and typeset industry. Lorem Ipsum has been the industry standard text.',
                                      style: AppTextStyles.labelSmall.copyWith(
                                        fontSize: 11.sp,
                                        color: const Color.fromARGB(
                                            255, 100, 100, 100),
                                      ),
                                      // textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // ),
                                ],
                              ),
                              // child: Image.asset(
                              //   AppImageResources.property,
                              //   fit: BoxFit.cover,
                              // ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
