import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/chat_controller.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sizer/sizer.dart';

class Chating extends StatefulWidget {
  String? name;

  String? conId;

  String? customerId;
  String? agentId;
  Chating({super.key, this.name, this.agentId, this.conId, this.customerId});

  @override
  State<Chating> createState() => _ChatingState();
}

class _ChatingState extends State<Chating> {
  var chattController = Get.put(ChatController());
  var chatController = TextEditingController();
  int uid = 0;
  bool isTextFieldClicked = false;

  late PusherClient pusher;

  @override
  void initState() {
    super.initState();

    _initiatePusherSocketForMessaging();

    chattController.getChat(int.parse(widget.conId.toString()));
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
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 2.0.h),
                height: 75.0.h,
                width: 100.0.w,
                child: Obx(() => chattController.loadingChat.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : chattController.chatModel.data!.length < 0
                        ? const Center(child: Text("Say Hi"))
                        : ListView.builder(
                            itemCount: chattController.chatModel.data?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 1.0.h,
                                    bottom: 1.0.h,
                                    left: 4.0.w,
                                    right: 4.0.w),
                                decoration: BoxDecoration(
                                    color: chattController.uid ==
                                            chattController
                                                .chatModel.data![index].senderId
                                        ? Colors.red
                                        : AppColors.appthem,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    chattController
                                            .chatModel.data?[index].message ??
                                        "",
                                    style: AppTextStyles.heading1,
                                  ),
                                ),
                              );
                            }))),

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
}
