import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/chat_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

class Chating extends StatefulWidget {
  String? name;
  Chating({super.key, this.name});

  @override
  State<Chating> createState() => _ChatingState();
}

class _ChatingState extends State<Chating> {
  var chattController = Get.put(ChatController());
  var chatController = TextEditingController();

  List<ChatModel> chats = [];
  bool isTextFieldClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Obx(() => chattController.loadingChat.value
            ? const Center(child: CircularProgressIndicator())
            : Text(
                widget.name ?? '',
                style: AppTextStyles.heading1,
              )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 2.0.h),
              height: 75.0.h,
              width: 100.0.w,
              child: Obx(
                () => chattController.loadingChat.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: chattController.chatModel.data?.length,
                        itemBuilder: (context, index) {
                          // var agentName = chattController
                          //     .chatModel.data![index].user!.username;
                          // String? firstChar;
                          // if (agentName!.isNotEmpty) {
                          //   firstChar = agentName[0];
                          // }
                          return Column(
                            children: [
                              Container(
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
                                          borderRadius:
                                              BorderRadius.circular(300)),
                                      child: Center(
                                          child: Text(
                                        "dddd",
                                        style: AppTextStyles.heading1.copyWith(
                                            fontWeight: FontWeight.w800),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          chattController.chatModel.data?[index]
                                                  .user!.username ??
                                              '',
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          chattController.chatModel.data?[index]
                                                  .message ??
                                              '',
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      DateFormat('dd.MM.yyyy').format(
                                          DateTime.parse(chattController
                                              .chatModel
                                              .data![index]
                                              .customer!
                                              .updatedAt
                                              ??"")),
                                      style: AppTextStyles.heading1
                                          .copyWith(color: AppColors.appthem),
                                    ),
                                    SizedBox(
                                      width: 2.0.w,
                                    )
                                  ],
                                ),
                              ),
                              Container(
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
                                          borderRadius:
                                              BorderRadius.circular(300)),
                                      child: Center(
                                          child: Text(
                                        'Me',
                                        style: AppTextStyles.heading1.copyWith(
                                            fontWeight: FontWeight.w800),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 3.0.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Me',
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                        Text(
                                          chattController
                                                  .sendMsgModel.data!.message ??
                                              '',
                                          style: AppTextStyles.heading1
                                              .copyWith(
                                                  color: AppColors.appthem),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      DateFormat('dd.MM.yyyy').format(
                                          DateTime.parse(chattController
                                              .chatModel
                                              .data![index]
                                              .customer!
                                              .updatedAt
                                              .toString())),
                                      style: AppTextStyles.heading1
                                          .copyWith(color: AppColors.appthem),
                                    ),
                                    SizedBox(
                                      width: 2.0.w,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
              ),
            ),

            ////////////////
            Container(
              margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 1.0.h),
              height: 8.0.h,
              width: 100.0.w,
              decoration: CustomDecorations.mainCon,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextField(
                      editingController: chatController,
                      hintText: "Message",
                      onChanged: (val) {},
                    ),
                  )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          chattController.sendMsgMethod();
                        });

                        chatController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.appthem,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatModel {
  String? chat;
  String? userName;
  String? logo;

  ChatModel({this.chat, this.userName, this.logo});
}
