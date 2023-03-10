// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/styles/app_textstyles.dart';

class Getintouch extends StatelessWidget {
  const Getintouch({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appthem,
          centerTitle: true,
          title: Text("Get In Touch With Us", style: AppTextStyles.heading1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30.0.h,
            width: 100.0.w,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 243, 184, 237)),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(
                    'Get In Touch with Us',
                    style: AppTextStyles.heading1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.location_city),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Container(
                      child:
                          const Text('Bahria Town Phase 7 jasim Arcade Plaza'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.email),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Container(
                      child: const Text('Abc@gmail.com'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: const Icon(Icons.phone),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Container(
                      child: const Text('051-5678982'),
                    )
                  ],
                ),
              )
            ]),

            //     Padding(
            //       padding: const EdgeInsets.all(4.0),
            //       child: Row(
            //         children: [
            //           Container(
            //             child: const Icon(Icons.location_city),
            //           ),
            //           SizedBox(
            //             width: 2.0.w,
            //           ),
            //           Container(
            //             child: Text('Bahria Town Phase # 7 Jasim Arcade Plaza',
            //                 style: AppTextStyles.labelSmall),
            //           ),
            //           //2nd data
            //           Row(
            //             children: [
            //               Container(
            //                 child: const Icon(Icons.email),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //             width: 2.0.w,
            //           ),
            //           Container(
            //             child:
            //                 Text('Abc@gmail.com', style: AppTextStyles.labelSmall),
            //           ),

            //           //3rd data
            //           Row(
            //             children: [
            //               Container(
            //                 child: const Icon(Icons.phone),
            //               ),
            //             ],
            //           ),
            //           SizedBox(
            //             width: 2.0.w,
            //           ),
            //           Container(
            //             child: Text('051-4567897', style: AppTextStyles.labelSmall),
            //           ),
            //         ],
            //       ),
            //     ),
          ),
        ),
      ),
    );
  }
}
