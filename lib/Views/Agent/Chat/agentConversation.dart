// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/agent_chat_controller/agentconversation_controller.dart';
import 'agentchat.dart';

class AgentConversationScreen extends StatelessWidget {
  AgentConversationScreen({super.key});
  var controller = Get.put(AgentChatController());
  // int? uid;
  // getUserId() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   uid = pref.getInt("userid") ?? 0;
  //   print("************************$uid");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          "Chat",
          style: AppTextStyles.heading1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 2.0.h
            // , left: 3.0.w, right: 3.0.w
            ),
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
            SizedBox(height: 1.5.h),
            Obx(
              () => SizedBox(
                // margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
                height: 78.0.h,
                width: 100.0.w,
                child: controller.loadingConversation.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.errConversationLoad.value != ''
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller
                                          .getConversation(controller.uid!);
                                    },
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: AppColors.appthem,
                                    )),
                                SizedBox(
                                  height: 1.0.h,
                                ),
                                Text(controller.errConversationLoad.value),
                              ],
                            ),
                          )
                        : controller.conversationModel.data!.isEmpty
                            ? const Center(child: Text("No Chat Found"))
                            : ListView.builder(
                                itemCount:
                                    controller.conversationModel.data!.length,
                                itemBuilder: (context, index) {
                                  var userName = controller.conversationModel
                                      .data?[index].sendercustomer!.firstName;
                                  String? firstChar;
                                  if (userName!.isNotEmpty) {
                                    firstChar = userName[0];
                                  }
                                  return Column(
                                    children: [
                                      ListTile(
                                        onTap: () async {
                                          SharedPreferences pref =
                                              await SharedPreferences
                                                  .getInstance();
                                          pref.setInt(
                                              "conversatinId",
                                              controller.conversationModel
                                                  .data![index].id!);

                                          Get.to(
                                              () => AgentChating(
                                                    name:
                                                        "${controller.conversationModel.data![index].sendercustomer!.firstName} ${controller.conversationModel.data![index].sendercustomer!.lastName}",
                                                    conId: controller
                                                        .conversationModel
                                                        .data![index]
                                                        .id
                                                        .toString(),
                                                    customerId: controller
                                                        .conversationModel
                                                        .data![index]
                                                        .customer
                                                        .toString(),
                                                    agentId: controller
                                                        .conversationModel
                                                        .data![index]
                                                        .agent
                                                        .toString(),
                                                  ),
                                              duration: const Duration(
                                                  milliseconds: 600),
                                              transition:
                                                  Transition.rightToLeft);
                                        },
                                        visualDensity: VisualDensity.compact,
                                        leading: Container(
                                          height: 12.0.w,
                                          width: 12.0.w,
                                          decoration: BoxDecoration(
                                              color: AppColors.themecolor,
                                              borderRadius:
                                                  BorderRadius.circular(300)),
                                          child: Center(
                                              child: Text(
                                            firstChar.toString(),
                                            style: AppTextStyles.heading1
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w800),
                                          )),
                                        ),
                                        title: Text(
                                          "${controller.conversationModel.data![index].sendercustomer!.firstName ?? ''} ${controller.conversationModel.data![index].sendercustomer!.lastName} ",
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        subtitle: Text(
                                          controller.conversationModel
                                                  .data?[index].lastmessage ??
                                              '',
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem),
                                        ),
                                      ),
                                      const Divider()
                                    ],
                                  );

                                  // InkWell(
                                  //   onTap: () async {
                                  //     SharedPreferences pref =
                                  //         await SharedPreferences.getInstance();
                                  //     pref.setInt(
                                  //         "conversatinId",
                                  //         controller.conversationModel
                                  //             .data![index].id!);

                                  //     Get.to(
                                  //         () => Chating(
                                  //               name:
                                  //                   "${controller.conversationModel.data![index].recieveragent!.firstName} ${controller.conversationModel.data![index].recieveragent!.lastName}",
                                  //               conId: controller
                                  //                   .conversationModel
                                  //                   .data![index]
                                  //                   .id
                                  //                   .toString(),
                                  //               customerId: controller
                                  //                   .conversationModel
                                  //                   .data![index]
                                  //                   .customer
                                  //                   .toString(),
                                  //               agentId: controller
                                  //                   .conversationModel
                                  //                   .data![index]
                                  //                   .agent
                                  //                   .toString(),
                                  //             ),
                                  //         duration:
                                  //             const Duration(milliseconds: 600),
                                  //         transition: Transition.rightToLeft);
                                  //   },
                                  //   child: Container(
                                  //     margin: EdgeInsets.only(
                                  //       // top: index == 0 ? 1.0.h : 1.0.h,
                                  //       bottom: index == 9 ? 1.0.h : 0.0.h,
                                  //       // left: .7.w,
                                  //       // right: .7.w
                                  //     ),
                                  //     height: 9.0.h,
                                  //     width: 100.0.w,
                                  //     child: Column(
                                  //       // mainAxisAlignment:
                                  //       //     MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Row(
                                  //           // crossAxisAlignment:
                                  //           //     CrossAxisAlignment.start,
                                  //           children: [
                                  //             SizedBox(
                                  //               width: 2.0.w,
                                  //             ),
                                  //             Container(
                                  //               height: 12.0.w,
                                  //               width: 12.0.w,
                                  //               decoration: BoxDecoration(
                                  //                   color: AppColors.themecolor,
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           300)),
                                  //               child: Center(
                                  //                   child: Text(
                                  //                 firstChar.toString(),
                                  //                 style: AppTextStyles.heading1
                                  //                     .copyWith(
                                  //                         fontWeight:
                                  //                             FontWeight.w800),
                                  //               )),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 3.0.w,
                                  //             ),
                                  //             Column(
                                  //               // crossAxisAlignment:
                                  //               //     CrossAxisAlignment.start,
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.center,
                                  //               children: [
                                  //                 Text(
                                  //                   "${controller.conversationModel.data![index].recieveragent!.firstName ?? ''} ",
                                  //                   style: AppTextStyles
                                  //                       .heading1
                                  //                       .copyWith(
                                  //                           color: AppColors
                                  //                               .appthem,
                                  //                           fontWeight:
                                  //                               FontWeight
                                  //                                   .w800),
                                  //                 ),
                                  //                 Text(
                                  //                   controller
                                  //                           .conversationModel
                                  //                           .data?[index]
                                  //                           .recieveragent!
                                  //                           .deactivateMessage ??
                                  //                       '',
                                  //                   style: AppTextStyles
                                  //                       .heading1
                                  //                       .copyWith(
                                  //                           color: AppColors
                                  //                               .appthem),
                                  //                 )
                                  //               ],
                                  //             ),
                                  //             // const Spacer(),

                                  //             // Text(
                                  //             //   DateFormat('dd.MM.yyyy').format(
                                  //             //       DateTime.parse(controller
                                  //             //               .conversationModel
                                  //             //               .data![index]
                                  //             //               .chats![index]
                                  //             //               .updatedAt ??
                                  //             //           "".toString())),
                                  //             //   style: AppTextStyles.heading1
                                  //             //       .copyWith(
                                  //             //           color: AppColors.appthem),
                                  //             // ),

                                  //             // SizedBox(
                                  //             //   width: 2.0.w,
                                  //             // )
                                  //           ],
                                  //         ),
                                  //         const Divider()
                                  //       ],
                                  //     ),
                                  //   ),
                                  // );
                                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
