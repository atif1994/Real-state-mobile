import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/chat_controller.dart';
import 'package:prologic_29/data/Models/message_model/message_model.dart';
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
  MessageModel? messageModel;
  var chattController = Get.put(ChatController());
  var chatController = TextEditingController();

  bool isTextFieldClicked = false;

  late PusherClient pusher;

  @override
  void initState() {
    super.initState();

    _initiatePusherSocketForMessaging();
  }

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
              child: Obx(() => chattController.loadingChat.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: chattController.sendMsgModel.data?.length,
                          itemBuilder: (context, index) {
                            return Text(chattController
                                    .sendMsgModel.data?[index].message ??
                                "");
                          })
                  //  chattController.chatModel.data?.length
                  // : ListView.builder(
                  //     itemCount: chattController.chatModel.data!.length,
                  //     itemBuilder: (context, index) {
                  //       String? agentName = chattController
                  //               .chatModel.data?[index].user?.username ??
                  //           '';
                  //       String? firstChar;
                  //       if (agentName.isNotEmpty) {
                  //         firstChar = agentName[0];
                  //       }
                  //       //check value in comment for send msg
                  //       int? custId = chattController
                  //               .chatModel.data![index].customer?.id ??
                  //           0;
                  //       int? agentId = int.parse(chattController
                  //           .chatModel.data![index].agent
                  //           .toString());
                  //       int? convId = int.parse(chattController
                  //           .chatModel.data![index].id
                  //           .toString());

                  //       print("firs char======$firstChar");
                  //       print(
                  //           "mesg======${chattController.chatModel.data?[index].message}= $custId =$agentId =$convId");
                  //       customerId = custId;
                  //       agentid = agentId;
                  //       convid = convId;

                  //       return Column(
                  //         children: [
                  //           Container(
                  //             margin: EdgeInsets.only(
                  //                 top: index == 0 ? 1.0.h : 2.0.h,
                  //                 bottom: index == 9 ? 1.0.h : 0.0.h),
                  //             height: 8.0.h,
                  //             width: 100.0.w,
                  //             decoration: CustomDecorations.mainCon,
                  //             child: Row(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 SizedBox(
                  //                   width: 2.0.w,
                  //                 ),
                  //                 Container(
                  //                   height: 12.0.w,
                  //                   width: 12.0.w,
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.orange,
                  //                       borderRadius:
                  //                           BorderRadius.circular(300)),
                  //                   child: Center(
                  //                       child: Text(
                  //                     firstChar ?? '',
                  //                     style: AppTextStyles.heading1.copyWith(
                  //                         fontWeight: FontWeight.w800),
                  //                   )),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 3.0.w,
                  //                 ),
                  //                 Column(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   mainAxisAlignment:
                  //                       MainAxisAlignment.center,
                  //                   children: [
                  //                     // chattController.chatModel.data?[index]
                  //                     //           .user!.username ??
                  //                     Text(
                  //                       chattController.chatModel.data?[index]
                  //                               .user!.username ??
                  //                           '',
                  //                       style: AppTextStyles.heading1
                  //                           .copyWith(
                  //                               color: AppColors.appthem,
                  //                               fontWeight: FontWeight.w800),
                  //                     ),
                  //                     //  chattController.chatModel.data?[index]
                  //                     //         .message ??
                  //                     Text(
                  //                       chattController.chatModel.data![index]
                  //                               .message ??
                  //                           "no msg",
                  //                       style: AppTextStyles.heading1
                  //                           .copyWith(
                  //                               color: AppColors.appthem),
                  //                     )
                  //                   ],
                  //                 ),
                  //                 const Spacer(),
                  //                 Text(
                  //                   DateFormat('dd.MM.yyyy').format(
                  //                       DateTime.parse(chattController
                  //                               .chatModel
                  //                               .data![index]
                  //                               .user
                  //                               ?.updatedAt ??
                  //                           " ")),
                  //                   style: AppTextStyles.heading1
                  //                       .copyWith(color: AppColors.appthem),
                  //                 ),
                  //                 SizedBox(
                  //                   width: 2.0.w,
                  //                 )
                  //               ],
                  //             ),
                  //           ),

                  //         ],
                  //       );
                  //     }),
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
                        chattController.sendMsgMethod(
                            int.parse(widget.customerId.toString()),
                            int.parse(widget.agentId.toString()),
                            chatController.text,
                            int.parse(widget.conId.toString()));

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

    Channel channel = pusher.subscribe('message_${11}');

    channel.bind('App\\Events\\MessageSent', (PusherEvent? event) {
      // print('event data: ' + event!.data.toString());

      final data = json.decode(event!.data.toString());

      // String time = getLocalTime(
      //   hour: data['created_at']
      //       .toString()
      //       .split('T')[1]
      //       .toString()
      //       .split(':')[0]
      //       .toString(),
      //   minute: data['created_at']
      //       .toString()
      //       .split('T')[1]
      //       .toString()
      //       .split(':')[1]
      //       .toString(),
      // );

      // MyDateTime myDateTime = MyDateTime(
      //   myTimeModel: MyTimeModel(
      //     hour: time.split(':')[0],
      //     minute: time.split(':')[1].split(' ')[0],
      //     meridian: time.split(':')[1].split(' ')[1],
      //   ),
      // );

      setState(() {
        chattController.sendMsgModel.message = data['message'];
        // pagingController.itemList!.add(MessageModel(
        //     messageId: 0,
        //     message: data['message'],
        //     senderId: widget.receiverId,
        //     receiverId: widget.userInfoProvider.getUserInfo.userId!,
        //     image: '',
        //     isTimeFromServer: false,
        //     myDateTime: MyDateTime(
        //       myDateModel: MyDateModel(
        //         day: data['created_at']
        //             .toString()
        //             .split('T')[0]
        //             .toString()
        //             .split('-')[2]
        //             .toString(),
        //         month: data['created_at']
        //             .toString()
        //             .split('T')[0]
        //             .toString()
        //             .split('-')[1]
        //             .toString(),
        //         year: data['created_at']
        //             .toString()
        //             .split('T')[0]
        //             .toString()
        //             .split('-')[0]
        //             .toString(),
        //       ),
        //       myTimeModel: myDateTime.myTimeModel,
        //     )));
      });
    });
  }
}
