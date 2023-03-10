// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/chat_controller.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/session_controller.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Chating extends StatefulWidget {
  String? name;

  String? conId;

  String? customerId;
  String? agentId;
  String? senderId;
  Chating(
      {super.key,
      this.name,
      this.agentId,
      this.conId,
      this.customerId,
      this.senderId});

  @override
  State<Chating> createState() => _ChatingState();
}

class _ChatingState extends State<Chating> {
  var chattController = Get.put(ConversationController());
  var chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String uid = "";
  bool isTextFieldClicked = false;

  late PusherClient pusher;
  var itsMe = true;
  int? conversationId;
  @override
  void initState() {
    super.initState();
    itsMe = SessionController().userId == widget.customerId;
    getUserId();
    _initiatePusherSocketForMessaging();
    conversationId = int.parse(widget.agentId.toString());

    print("con id in chatting screen____ ${widget.conId!}");
    chattController.getChat(int.parse(widget.conId!));

    _scrollDown();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      uid = pref.getInt("userid").toString();
    });

    print("this is user id*************************$uid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        title: Text(
          widget.name ?? '',
          style: AppTextStyles.heading1,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 2.0.h),
                height: 75.0.h,
                width: 100.0.w,
                child:
                    // Obx(() => chattController.loadChat.value
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     :
                    // chattController.chatModel.data!.length < 0
                    //     ? const Center(child: Text("Say Hi"))
                    //     :
                    GetBuilder<ConversationController>(
                  init: ConversationController(),
                  initState: (_) {},
                  builder: (controller) {
                    return FutureBuilder(
                      future: controller
                          .getChat(int.parse(widget.conId.toString())),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return ListView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.only(bottom: 45),
                              shrinkWrap: true,
                              itemCount: controller.chatModel.data?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: uid ==
                                              controller.chatModel.data![index]
                                                  .senderId
                                          ? 20.0.w
                                          : 4.0.w,
                                      right: uid ==
                                              controller.chatModel.data![index]
                                                  .senderId
                                          ? 4.0.w
                                          : 20.0.w),
                                  child: SizedBox(
                                    width: 50.0.w,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 1.0.h,
                                        bottom: .5.h,
                                      ),
                                      decoration: BoxDecoration(
                                          color: uid ==
                                                  controller.chatModel
                                                      .data![index].senderId
                                              ? AppColors.appthem
                                              : AppColors.appthem
                                                  .withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 2.0.w,
                                            top: 1.0.h,
                                            bottom: 2.0.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              uid ==
                                                      controller.chatModel
                                                          .data![index].senderId
                                                  ? "You"
                                                  : controller
                                                          .chatModel
                                                          .data?[index]
                                                          .user!
                                                          .username ??
                                                      "",
                                              style: AppTextStyles.appbar,
                                            ),
                                            SizedBox(
                                              height: 1.0.h,
                                            ),
                                            SizedBox(
                                              // color: Colors.red,
                                              width: 65.0.w,
                                              child: Text(
                                                controller.chatModel
                                                        .data?[index].message ??
                                                    "",
                                                style: AppTextStyles.heading1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                )),

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
                        print(
                            "message send........ data before send  chat Api Call in coId= + ${int.parse(widget.conId.toString())} + agent= ${int.parse(widget.agentId.toString())} + customer =${int.parse(widget.customerId.toString())}");
                        chattController.sendMsgMethod(
                            int.parse(widget.customerId.toString()),
                            int.parse(widget.agentId.toString()),
                            chatController.text,
                            int.parse(widget.conId.toString()));
                        chatController.clear();
                        chattController
                            .getChat(int.parse(widget.conId.toString()));
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

  Future<void> _initiatePusherSocketForMessaging() async {
    pusher = PusherClient(
        '4b70cc9598b80dcadac2',
        PusherOptions(
          host: 'http://realestate.tecrux.net',
          cluster: 'ap2',
          auth: PusherAuth(
            'http://realestate.tecrux.net/api/broadcasting/auth',
          ),
        ),
        autoConnect: false);

    pusher.connect();

    pusher.onConnectionStateChange((state) {
      print(
          "previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });

    pusher.onConnectionError((error) {
      print("error: ${error!.message}");
    });

    Channel channel = pusher.subscribe('message_${chattController.uid}');

    channel.bind('App\\Events\\MessageSent', (PusherEvent? event) {
      // print('event data: ' + event!.data.toString());

      final data = json.decode(event!.data.toString());

      setState(() {
        chattController.chatModel.data!.add(Datum(
            message: data['message'],
            senderId: widget.customerId,
            id: int.parse(widget.agentId.toString())));
      });
    });
  }

  void _scrollDown() {
    Future.delayed(
        const Duration(
          milliseconds: 50,
        ), () {
      _scrollController.position.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}
