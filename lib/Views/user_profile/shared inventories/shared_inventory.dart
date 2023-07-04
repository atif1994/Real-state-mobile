import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../custom_widgets/my_custom_button.dart';
import '../../../data/Controllers/user_profile_section_controller/shared_inventories_controller.dart';
import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/appcolors.dart';
import '../../../utils/styles/app_textstyles.dart';

class sharedinventories extends StatelessWidget {
  var sharedinventorycontroller = Get.put(ShareInventoryController());
  sharedinventories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Shared Inventories", style: AppTextStyles.heading1),
      ),
      body: Obx(() => sharedinventorycontroller.loadingShareInventory.value
          ? loader
          : sharedinventorycontroller.errorLoadingShareInventory.value != ""
              ? Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          sharedinventorycontroller.getShareInventory();
                        },
                        icon: const Icon(Icons.refresh)),
                    Text(sharedinventorycontroller
                        .errorLoadingShareInventory.value),
                  ],
                )
              : sharedinventorycontroller.ShareInventoryData.data!.isEmpty
                  ? nopostexist
                  : ListView.builder(
                      itemCount: sharedinventorycontroller
                          .ShareInventoryData.data!.length,
                      itemBuilder: ((context, index) {
                        String dateTimeString = sharedinventorycontroller
                            .ShareInventoryData.data![index].createdAt
                            .toString();
                        DateTime dateTime = DateTime.parse(dateTimeString);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(dateTime);
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 222, 222, 222)),
                          margin: EdgeInsets.only(
                              top: 1.0.h, left: 2.w, right: 2.w),
                          width: 100.0.w,
                          // height: 140,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                            child: Row(
                              children: [
                                Image.network(
                                  '${AppUrls.baseUrl2}${sharedinventorycontroller.ShareInventoryData.data![index].images![0]}',
                                  // 'https://realestate.tecrux.solutions/storage/properties/broB1qXL__63f61d60725d5-150x150.jpeg',
                                  width: 30.w,
                                  height: 100,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                  width: 58.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sharedinventorycontroller
                                            .ShareInventoryData
                                            .data![index]
                                            .name
                                            .toString(),
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack),
                                      ),
                                      Text(
                                        '${sharedinventorycontroller.ShareInventoryData.data![index].firstName} ${sharedinventorycontroller.ShareInventoryData.data![index].lastName}',
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          MyCustomButton(
                                            text: 'Revoke Control',
                                            onPressed: () {
                                              sharedinventorycontroller
                                                  .postRevokeControl(
                                                      sharedinventorycontroller
                                                          .ShareInventoryData
                                                          .data![index]
                                                          .agentId!,
                                                      sharedinventorycontroller
                                                          .ShareInventoryData
                                                          .data![index]
                                                          .propertyId!);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }))),
    );
  }
}
