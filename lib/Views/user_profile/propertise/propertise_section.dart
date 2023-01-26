import 'package:flutter/material.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class PropertiseSection extends StatelessWidget {
  const PropertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Propertise",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.0.h, left: 2.0.w, right: 2.0.w),
            height: 16.0.h,
            width: 100.0.w,
            decoration: CustomDecorations.mainCon,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search))),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 2.0.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () {},
                        text: "Create",
                      ),
                    ),
                    SizedBox(
                      width: 2.0.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        onPressed: () {},
                        text: "Reload",
                      ),
                    ),
                    SizedBox(
                      width: 2.0.w,
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            child: Container(
              margin: EdgeInsets.only(
                  left: 2.0.w, right: 2.0.w, top: 1.0.h, bottom: 1.0.h),
              height: 70.0.h,
              width: 100.0.w,
              decoration: CustomDecorations.mainCon,
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: 2.0.w,
                          right: 2.0.w,
                          top: index == 0 ? 1.0.h : 2.0.h,
                          bottom: index == 5 ? 2.0.h : 0.0.h),
                      height: 12.0.h,
                      width: 100.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: index % 2 == 0
                            ? Colors.grey[400]
                            : Colors.grey[300],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 4.0.h,
                            width: 100.0.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "62",
                                  style: AppTextStyles.heading1
                                      .copyWith(color: AppColors.appthem),
                                ),
                                Text(
                                  "DHA 2eklfdtlhr;ele",
                                  style: AppTextStyles.heading1
                                      .copyWith(color: AppColors.appthem),
                                ),
                                Text(
                                  "For Sale",
                                  style: AppTextStyles.heading1
                                      .copyWith(color: AppColors.appthem),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            height: 4.0.h,
                            width: 100.0.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(),
                                Container(
                                  height: 12.0.w,
                                  width: 10.0.w,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.note_add,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(),
                                Container(
                                  height: 12.0.w,
                                  width: 10.0.w,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(),
                                Container(
                                  height: 12.0.w,
                                  width: 10.0.w,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
