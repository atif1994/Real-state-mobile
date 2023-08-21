import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/Views/Agent/Agent_Drawer/Shared%20Inventory/edit_property.dart';
import 'package:prologic_29/data/Controllers/Shared%20Inventory%20Agent/get_property_detail.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/Controllers/Shared Inventory Agent/agent_shared_inventory_controller.dart';
import '../../../../utils/constants/app_urls.dart';
import '../../../../utils/constants/appcolors.dart';
import '../../../../utils/styles/app_textstyles.dart';

class AgentSharedInventory extends StatelessWidget {
  var agentsharedinventorycontroller = Get.put(AgentShareInventoryController());
  var getpropertycontroller =
      Get.lazyPut<PropertyDetailController>(() => PropertyDetailController());
  AgentSharedInventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Shared Inventories", style: AppTextStyles.heading1),
      ),
      body: Obx(() => agentsharedinventorycontroller
              .loadingAgentShareInventory.value
          ? loader
          : agentsharedinventorycontroller
                      .errorLoadingAgentShareInventory.value !=
                  ''
              ? Center(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              agentsharedinventorycontroller
                                  .getShareInventory();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: AppColors.appthem,
                            )),
                        SizedBox(
                          height: 1.0.h,
                        ),
                        Text(agentsharedinventorycontroller
                            .errorLoadingAgentShareInventory.value),
                      ],
                    ),
                  ),
                )
              : agentsharedinventorycontroller.ShareInventoryData.data!.isEmpty
                  ? nopostexist
                  : ListView.builder(
                      itemCount: agentsharedinventorycontroller
                          .ShareInventoryData.data!.length,
                      itemBuilder: ((context, index) {
                        String dateTimeString = agentsharedinventorycontroller
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
                            padding: const EdgeInsets.fromLTRB(8, 12, 0, 8),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                agentsharedinventorycontroller
                                        .ShareInventoryData
                                        .data![index]
                                        .images!=null
                                    ?Image.network(
                                  '${AppUrls.baseUrl2}${agentsharedinventorycontroller.ShareInventoryData.data![index].images![0]}',
                                  // 'https://realestate.tecrux.solutions/storage/properties/broB1qXL__63f61d60725d5-150x150.jpeg',
                                  width: 30.w,
                                  height: 15.h,
                                )



                                    :  Image.asset(
                          "assets/noimage.jpeg",
                          height: 15.h,
                          width: 30.w,
                          ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                SizedBox(
                                  width: 56.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        agentsharedinventorycontroller
                                            .ShareInventoryData
                                            .data![index]
                                            .name
                                            .toString(),
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        formattedDate,
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack),
                                      ),
                                      Text(
                                        agentsharedinventorycontroller
                                            .ShareInventoryData
                                            .data![index]
                                            .moderationStatus
                                            .toString(),
                                        style: AppTextStyles.heading1.copyWith(
                                            color: AppColors.colorblack),
                                      ),
                                      // SizedBox(
                                      //   height: 0.3.h,
                                      // ),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                agentsharedinventorycontroller
                                                    .ShareInventoryData
                                                    .data![index]
                                                    .typeName
                                                    .toString(),
                                                // 'For Sale',
                                                style: AppTextStyles.heading1
                                                    .copyWith(
                                                        color: AppColors
                                                            .colorblack),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                              onPressed: () {
                                                Get.find<
                                                        PropertyDetailController>()
                                                    .getPropertydetail(int.parse(
                                                        agentsharedinventorycontroller
                                                            .ShareInventoryData
                                                            .data![index]
                                                            .propertyId
                                                            .toString()));
                                                Get.to(() => EditProperty(
                                                    pid: int.parse(
                                                        agentsharedinventorycontroller
                                                            .ShareInventoryData
                                                            .data![index]
                                                            .propertyId
                                                            .toString())));
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                color: Colors.blue.shade800,
                                              )),
                                          // IconButton(
                                          //     onPressed: () {},
                                          //     icon: const Icon(
                                          //       Icons.delete,
                                          //       color: Colors.red,
                                          //     ))
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
