import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/user_profile/chat/chatting_screen.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  var controller = Get.put(ChatController());
  int? uid;
  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid") ?? 0;
    print("************************$uid");
  }

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
            Obx(
              () => Container(
                  margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w),
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
                                            .getConversation(controller.uid);
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
                          : controller.conversationModel.data == null
                              ? const Center(child: Text("No Chat Found"))
                              : FutureBuilder(
                                  future: controller
                                      .getConversation(controller.uid),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      return ListView.builder(
                                          itemCount: controller
                                              .conversationModel.data!.length,
                                          itemBuilder: (context, index) {
                                            var agentName = controller
                                                .conversationModel
                                                .data?[index]
                                                .recieveragent!
                                                .firstName;
                                            String? firstChar;
                                            if (agentName!.isNotEmpty) {
                                              firstChar = agentName[0];
                                            }
                                            return InkWell(
                                              onTap: () async {
                                                SharedPreferences pref =
                                                    await SharedPreferences
                                                        .getInstance();
                                                pref.setInt(
                                                    "conversatinId",
                                                    controller.conversationModel
                                                        .data![index].id!);

                                                Get.to(
                                                    () => Chating(
                                                          name: controller
                                                              .conversationModel
                                                              .data![index]
                                                              .recieveragent!
                                                              .username,
                                                          conId: controller
                                                              .conversationModel
                                                              .data![index]
                                                              .chats![index]
                                                              .conversationId,
                                                          customerId: controller
                                                              .conversationModel
                                                              .data![index]
                                                              .chats![index]
                                                              .customer,
                                                          agentId: controller
                                                              .conversationModel
                                                              .data![index]
                                                              .chats![index]
                                                              .agent,
                                                          senderId: controller
                                                              .conversationModel
                                                              .data![index]
                                                              .chats![index]
                                                              .senderId,
                                                        ),
                                                    duration: const Duration(
                                                        milliseconds: 600),
                                                    transition:
                                                        Transition.rightToLeft);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: index == 0
                                                        ? 1.0.h
                                                        : 2.0.h,
                                                    bottom: index == 9
                                                        ? 1.0.h
                                                        : 0.0.h),
                                                height: 8.0.h,
                                                width: 100.0.w,
                                                decoration:
                                                    CustomDecorations.mainCon,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 2.0.w,
                                                    ),
                                                    Container(
                                                      height: 12.0.w,
                                                      width: 12.0.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.orange,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      300)),
                                                      child: Center(
                                                          child: Text(
                                                        firstChar.toString(),
                                                        style: AppTextStyles
                                                            .heading1
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                      )),
                                                    ),
                                                    SizedBox(
                                                      width: 3.0.w,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${controller.conversationModel.data![index].recieveragent!.firstName ?? ''} ",
                                                          style: AppTextStyles
                                                              .heading1
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .appthem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                        ),
                                                        Text(
                                                          controller
                                                                  .conversationModel
                                                                  .data?[index]
                                                                  .recieveragent!
                                                                  .deactivateMessage ??
                                                              '',
                                                          style: AppTextStyles
                                                              .heading1
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .appthem),
                                                        )
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    // Text(
                                                    //   DateFormat('dd.MM.yyyy').format(
                                                    //       DateTime.parse(controller
                                                    //               .conversationModel
                                                    //               .data![index]
                                                    //               .chats![index]
                                                    //               .updatedAt ??
                                                    //           "".toString())),
                                                    //   style: AppTextStyles.heading1
                                                    //       .copyWith(
                                                    //           color: AppColors.appthem),
                                                    // ),
                                                    SizedBox(
                                                      width: 2.0.w,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }
                                  },
                                )),
            ),
          ],
        ),
      ),
    );
  }
}
