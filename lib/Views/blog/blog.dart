import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';
import '../../utils/styles/custom_decorations.dart';

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prologic Blog',
          style: AppTextStyles.appbar,
        ),
        backgroundColor: AppColors.appthem,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                SizedBox(
                  height: 24.0.h,
                  width: 100.0.h,
                  child: Image.asset(
                    AppImageResources.propertyblog,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 3.0.h, bottom: 1.0.h, right: 1.0.w, left: 2.0.w),
                  child: Text(
                    'Lahore zameen Aurum -- A beaming Landmark of High End..',
                    style: AppTextStyles.labelSmall.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.5.h, left: 2.0.w),
                    child: Row(
                      children: [
                        Container(
                          height: 3.0.h,
                          width: 20.0.w,
                          decoration: const BoxDecoration(
                            color: AppColors.appthem,
                          ),
                          child: const Center(
                              child: Text(
                            'PROPERTY',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Container(
                          child: const Text(
                            '3 MIN READ',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 17.0.h, left: 2.0.w),
                  child: Container(
                    height: 3.0.h,
                    width: 70,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: const Center(
                        child: Text(
                      'READ ME',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromARGB(96, 238, 228, 228)),
            child: Column(
              children: [
                // SizedBox(
                //   height: 5.0.h,
                // ),
                ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(96, 238, 228, 228)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 4.0.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 4.0.w,
                                  right: 4.0.w,
                                  top: index == 0 ? 1.0.h : 2.0.h),
                              decoration: CustomDecorations.mainCon,
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





   // Stack(
          //   children: [
          //     Column(
          // children: [
          //   SizedBox(
          //     // margin: EdgeInsets.only(
          //     //   left: 5.0.w,
          //     //   right: 5.0.w,
          //     // ),
          //     height: 25.0.h,
          //     width: 100.0.h,

          //     child: Image.asset(
          //       AppImageResources.propertyblog,
          //       fit: BoxFit.cover,
          //     ),
          //   ),

          // ],
          //     )
          //   ],
          // ),
          // SizedBox(
          //   height: 5.0.h,
          //   child: const DecoratedBox(
          //     decoration: BoxDecoration(color: Colors.red),
          //   ),
          // ),
          // Container(
          // decoration: const BoxDecoration(
          //   color: Color.fromARGB(255, 173, 172, 172),
          // ),