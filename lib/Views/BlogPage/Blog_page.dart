import 'package:flutter/material.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import '../../utils/constants/image_resources.dart';
import '../../utils/styles/app_textstyles.dart';

class Blogpage2 extends StatelessWidget {
  const Blogpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Living in Prologic", style: AppTextStyles.heading1),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            AppImageResources.blog2,
            height: 40.0.h,
            width: 100.0.w,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      'Lahore zameen Aurum -- A beaming Landmark Project of High End Living',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack)),
                ),
                SizedBox(
                  height: 1.h,
                  // width: 2.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CustomButton(
                          text: 'property',
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 5.0.w,
                        ),
                        Container(
                          child: const Text('Read 3 Mintues'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 3.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                  width: 3.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'idea Location For Convenient Commutes',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                  width: 3.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'UltraModren Residential Experience',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                  width: 3.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'LifeStyles Features par Excellence',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                  width: 3.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Premium Luxry Apaertments within Your Reach',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 3.0.h,
                  width: 3.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Invest With Convenience-- Pay In 24 Months & Get Possession in 12 Months',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Havent Booked your property Yet? Let Us Help?',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                  ),
                ),
                SizedBox(
                  height: 1.0.h,
                  width: 2.0.w,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Share?',
                      style: AppTextStyles.heading1
                          .copyWith(color: AppColors.colorblack, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
