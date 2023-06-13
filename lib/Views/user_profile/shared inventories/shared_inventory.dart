import 'package:flutter/material.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/app_textstyles.dart';

class sharedinventories extends StatelessWidget {
  const sharedinventories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Shared Inventories", style: AppTextStyles.heading1),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 222, 222, 222)),
              margin: EdgeInsets.only(
                  top: index == 0 ? 1.0.h : 2.0.h, left: 2.w, right: 2.w),
              width: 100.0.w,
              height: 140,
              child: Row(
                children: [
                  Image.network(
                    'https://realestate.tecrux.solutions/storage/properties/broB1qXL__63f61d60725d5-150x150.jpeg',
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Property name: ',
                                style: AppTextStyles.heading1
                                    .copyWith(color: AppColors.colorblack),
                                children: [
                              TextSpan(
                                  text: 'my property',
                                  style: AppTextStyles.labelSmall)
                            ])),
                        RichText(
                            text: TextSpan(
                                text: 'Agent name: ',
                                style: AppTextStyles.heading1
                                    .copyWith(color: AppColors.colorblack),
                                children: [
                              TextSpan(
                                  text: 'Agent 1',
                                  style: AppTextStyles.labelSmall)
                            ])),
                        RichText(
                            text: TextSpan(
                                text: 'Created At: ',
                                style: AppTextStyles.heading1
                                    .copyWith(color: AppColors.colorblack),
                                children: [
                              TextSpan(
                                  text: 'Date', style: AppTextStyles.labelSmall)
                            ])),
                        Row(
                          children: const [
                            SizedBox(
                                width: 85,
                                child: CustomButton(
                                  text: 'Revoke Control',
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
