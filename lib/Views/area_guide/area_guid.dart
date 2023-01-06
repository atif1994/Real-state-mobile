import 'package:flutter/material.dart';
// import 'package:prologic_29/Views/Drawer/about_us.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

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
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    // style: TextStyle(
                    //   fontSize: 24,
                    //   fontWeight: FontWeight.w500,
                    // ),
                  ),
                  const SizedBox(
                    height: 8,
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
          const SizedBox(
            height: 30,
          ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 5,
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

                          // ignore: prefer_const_constructors
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: const Image(
                              // ignore: prefer_const_constructors
                              image: NetworkImage(
                                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                              fit: BoxFit.fitWidth,
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
          const CustomButton(
            text: 'Browse More Locations',
            onPressed: null,
          ),
        ],
      )),
    );
  }
}
// #242423
