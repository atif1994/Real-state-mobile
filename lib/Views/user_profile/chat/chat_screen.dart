import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/user_profile/chat/chatting_screen.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Security",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 2.0.h, left: 3.0.w, right: 3.0.w),
        height: 85.0.h,
        width: 100.0.w,
        decoration: CustomDecorations.mainCon,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "All Conversations",
                style: AppTextStyles.heading1.copyWith(
                    color: AppColors.appthem,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
              height: 78.0.h,
              width: 100.0.w,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => Chating(),
                            duration: const Duration(milliseconds: 600),
                            transition: Transition.rightToLeft);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            top: index == 0 ? 1.0.h : 2.0.h,
                            bottom: index == 9 ? 1.0.h : 0.0.h),
                        height: 8.0.h,
                        width: 100.0.w,
                        decoration: CustomDecorations.mainCon,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 2.0.w,
                            ),
                            Container(
                              height: 12.0.w,
                              width: 12.0.w,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(300)),
                              child: index % 2 == 0
                                  ? Center(
                                      child: Text(
                                        "T",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontWeight: FontWeight.w800),
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                      "M",
                                      style: AppTextStyles.heading1.copyWith(
                                          fontWeight: FontWeight.w800),
                                    )),
                            ),
                            SizedBox(
                              width: 3.0.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                index % 2 == 0
                                    ? Text(
                                        "Tahir Ahmad",
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.appthem,
                                            fontWeight: FontWeight.w800),
                                      )
                                    : Text(
                                        "Muhammad Khalid",
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.appthem,
                                            fontWeight: FontWeight.w800),
                                      ),
                                index % 2 == 0
                                    ? Text(
                                        "How Are You",
                                        style: AppTextStyles.heading1
                                            .copyWith(color: AppColors.appthem),
                                      )
                                    : Text(
                                        "I an Fine....Thanks",
                                        style: AppTextStyles.heading1
                                            .copyWith(color: AppColors.appthem),
                                      )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "2023-01-26 6",
                              style: AppTextStyles.heading1
                                  .copyWith(color: AppColors.appthem),
                            ),
                            SizedBox(
                              width: 2.0.w,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
