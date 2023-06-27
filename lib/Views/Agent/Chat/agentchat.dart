// ignore_for_file: must_be_immutable
import 'dart:math' as math;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/session_controller.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../data/Controllers/agent_chat_controller/agentconversation_controller.dart';

class AgentChating extends StatefulWidget {
  String? name;
  String? conId;
  String? customerId;
  String? agentId;
  String? senderId;
  AgentChating(
      {super.key,
      this.name,
      this.agentId,
      this.conId,
      this.customerId,
      this.senderId});

  @override
  State<AgentChating> createState() => _AgentChatingState();
}

class _AgentChatingState extends State<AgentChating> {
  // var chattController = Get.find<AgentChattingController>();
  var chattController = Get.put(AgentChatController());
  var chatController = TextEditingController();
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

    // print("con id in chatting screen____ ${widget.conId!}");
    chattController.getChat(int.parse(widget.conId!));

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // Scroll to the bottom after the frame is built
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // });

    // chatscroll();
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
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 1.0.h),
              height: 79.0.h,
              width: 100.0.w,
              child: Obx(() => chattController.loadChat.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : chattController.chatModel.data!.isEmpty
                      ? const Center(child: Text("Say Hi"))
                      : GetBuilder<AgentChatController>(
                          init: AgentChatController(),
                          initState: (_) {},
                          builder: (controller) {
                            return FutureBuilder(
                              future: controller
                                  .getChat(int.parse(widget.conId.toString())),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return ListView.builder(
                                    controller:
                                        chattController.scrollController,
                                    // padding: const EdgeInsets.only(bottom: 15),
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.chatModel.data?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8.0),
                                        child: Row(
                                          mainAxisAlignment: uid ==
                                                  controller.chatModel
                                                      .data![index].senderId
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            uid ==
                                                    controller.chatModel
                                                        .data![index].senderId
                                                ? const SizedBox()
                                                : Transform(
                                                    alignment: Alignment.center,
                                                    transform:
                                                        Matrix4.rotationY(
                                                            math.pi),
                                                    child: CustomPaint(
                                                      painter: CustomShape(
                                                          bgColor: AppColors
                                                              .themecolor),
                                                    ),
                                                  ),
                                            Flexible(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  color: uid ==
                                                          controller
                                                              .chatModel
                                                              .data![index]
                                                              .senderId
                                                      ? const Color.fromARGB(
                                                          255, 110, 132, 151)
                                                      : AppColors.themecolor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: uid ==
                                                            controller
                                                                .chatModel
                                                                .data![index]
                                                                .senderId
                                                        ? const Radius.circular(
                                                            15)
                                                        : const Radius.circular(
                                                            0),
                                                    topRight: uid ==
                                                            controller
                                                                .chatModel
                                                                .data![index]
                                                                .senderId
                                                        ? const Radius.circular(
                                                            0)
                                                        : const Radius.circular(
                                                            15),
                                                    bottomLeft:
                                                        const Radius.circular(
                                                            15),
                                                    bottomRight:
                                                        const Radius.circular(
                                                            15),
                                                  ),
                                                ),
                                                child: Text(
                                                  controller
                                                          .chatModel
                                                          .data?[index]
                                                          .message ??
                                                      "",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ),
                                            uid ==
                                                    controller.chatModel
                                                        .data![index].senderId
                                                ? Transform(
                                                    alignment: Alignment.center,
                                                    transform:
                                                        Matrix4.rotationY(
                                                            math.pi),
                                                    child: CustomPaint(
                                                      painter: CustomShape(
                                                          bgColor: const Color
                                                                  .fromARGB(255,
                                                              110, 132, 151)),
                                                    ),
                                                  )
                                                : const SizedBox()
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            );
                          },
                        )),
            ),

            ////////////////

            Row(
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
                    onPressed: () async {
                      print(
                          "message send........ data before send  chat Api Call in coId= + ${int.parse(widget.conId.toString())} + agent= ${int.parse(widget.agentId.toString())} + customer =${int.parse(widget.customerId.toString())}");
                      if (chatController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Write message first',
                            gravity: ToastGravity.TOP);
                      } else {
                        chattController.sendMsgMethod(
                          int.parse(widget.customerId.toString()),
                          int.parse(widget.agentId.toString()),
                          chatController.text,
                          int.parse(widget.conId.toString()),
                        );
                      }
                      chatController.clear();
                      chattController
                          .getChat(int.parse(widget.conId.toString()));
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.appthem,
                    ))
              ],
            ),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> _initiatePusherSocketForMessaging() async {
    pusher = PusherClient(
        '4b70cc9598b80dcadac2',
        PusherOptions(
          host: 'http://realestate.tecrux.solutions',
          cluster: 'ap2',
          auth: PusherAuth(
            'http://realestate.tecrux.solutions/api/broadcasting/auth',
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

  // void chatscroll() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   scrollController.animateTo(scrollController.position.maxScrollExtent,
  //       duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  // }
}

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape({required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
