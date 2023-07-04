// ignore_for_file: must_be_immutable
import 'dart:math' as math;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/data/Controllers/chat_controller.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/profile_propertise_controller/profile_all_propertise_controller.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Services/constants.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:prologic_29/utils/constants/session_controller.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Chating extends StatefulWidget {
  String? name;
  int? checkid;
  String? conId;
  String? customerId;
  String? agentId;
  String? senderId;
  Chating(
      {super.key,
      this.name,
      this.checkid,
      this.agentId,
      this.conId,
      this.customerId,
      this.senderId});

  @override
  State<Chating> createState() => _ChatingState();
}

class _ChatingState extends State<Chating> {
  var chattController = Get.put(ConversationController());
  var myproperties = Get.put(ProfilePropertiseController());
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

    print("con id in chatting screen____ ${widget.conId!}");
    chattController.getChat(int.parse(widget.conId!));

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // Scroll to the bottom after the frame is built
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    // });

    chatscroll();
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
                margin: EdgeInsets.only(left: 2.0.w, right: 2.0.w, top: 2.0.h),
                height: 78.0.h,
                width: 100.0.w,
                child:
                    // Obx(() => chattController.loadingChat.value
                    //     ? Center(
                    //         child:
                    //             Text('load ${chattController.loadingChat.value}'),
                    //       )
                    //     :
                    // chattController.chatModel.data!.isEmpty
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
                        if (snapshot.data != null) {
                          return ListView.builder(
                            // controller: chattController.scrollController,
                            // padding: const EdgeInsets.only(bottom: 15),
                            shrinkWrap: true,
                            itemCount: controller.chatModel.data?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: uid ==
                                          controller
                                              .chatModel.data![index].senderId
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    uid ==
                                            controller
                                                .chatModel.data![index].senderId
                                        ? const SizedBox()
                                        : Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(math.pi),
                                            child: CustomPaint(
                                              painter: CustomShape(
                                                  bgColor:
                                                      AppColors.themecolor),
                                            ),
                                          ),
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          color: uid ==
                                                  controller.chatModel
                                                      .data![index].senderId
                                              ? const Color.fromARGB(
                                                  255, 110, 132, 151)
                                              : AppColors.themecolor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: uid ==
                                                    controller.chatModel
                                                        .data![index].senderId
                                                ? const Radius.circular(15)
                                                : const Radius.circular(0),
                                            topRight: uid ==
                                                    controller.chatModel
                                                        .data![index].senderId
                                                ? const Radius.circular(0)
                                                : const Radius.circular(15),
                                            bottomLeft:
                                                const Radius.circular(15),
                                            bottomRight:
                                                const Radius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          controller.chatModel.data?[index]
                                                  .message ??
                                              "",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    uid ==
                                            controller
                                                .chatModel.data![index].senderId
                                        ? Transform(
                                            alignment: Alignment.center,
                                            transform:
                                                Matrix4.rotationY(math.pi),
                                            child: CustomPaint(
                                              painter: CustomShape(
                                                  bgColor: const Color.fromARGB(
                                                      255, 110, 132, 151)),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                                //     SizedBox(
                                //   width: 50.0.w,
                                //   child: Container(
                                //     margin: EdgeInsets.only(
                                //       top: 1.0.h,
                                //       bottom: .5.h,
                                //     ),
                                //     decoration: BoxDecoration(
                                // color: uid ==
                                //         controller.chatModel
                                //             .data![index].senderId
                                // ? const Color.fromARGB(
                                //     255, 110, 132, 151)
                                //             : AppColors.themecolor,
                                //         borderRadius: const BorderRadius.only(
                                //             topRight: Radius.circular(10),
                                //             bottomLeft: Radius.circular(10))),
                                //     child: Padding(
                                //       padding: EdgeInsets.only(
                                //           left: 2.0.w,
                                //           top: 1.0.h,
                                //           bottom: 2.0.h),
                                //       child: Column(
                                //         crossAxisAlignment:
                                //             CrossAxisAlignment.start,
                                //         children: [
                                //           Text(
                                // uid ==
                                //         controller.chatModel
                                //             .data![index].senderId
                                //     ? "You"
                                //     : controller
                                //             .chatModel
                                //             .data?[index]
                                //             .user!
                                //             .username ??
                                //         "",
                                //             style: AppTextStyles.appbar
                                //                 .copyWith(
                                //                     fontWeight:
                                //                         FontWeight.bold),
                                //           ),
                                //           SizedBox(
                                //             height: 1.0.h,
                                //           ),
                                //           Container(
                                //             margin: const EdgeInsets.only(
                                //               left: 10,
                                //             ),
                                //             // color: Colors.red,
                                //             width: 65.0.w,
                                //             child: Text(
                                // controller.chatModel
                                //         .data?[index].message ??
                                //     "",
                                //               style: AppTextStyles.labelSmall
                                //                   .copyWith(
                                //                       color: AppColors
                                //                           .colorWhite),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: loader,
                          );
                        }
                      },
                    );
                  },
                )
                // )
                ),
            Row(
              children: [
                OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      showinventorybottomsheet(context);
                    },
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 22, 82, 131),
                    )),
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
                      if (chatController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'Write message first',
                            gravity: ToastGravity.TOP);
                      } else {
                        chattController.sendMsgMethod(
                            int.parse(widget.customerId.toString()),
                            int.parse(widget.agentId.toString()),
                            chatController.text,
                            int.parse(widget.conId.toString()));
                        // chattController
                        //     .getChat(int.parse(widget.conId.toString()));
                        sendmessagescroll();
                        chatController.clear();
                      }
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.appthem,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  showinventorybottomsheet(BuildContext context) {
    showModalBottomSheet(
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    "Share Inventory",
                    style: AppTextStyles.labelSmall
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                SizedBox(
                  // width: 80.w,
                  height: 41.h,
                  child: Obx(
                    () => myproperties.loadingPropertise.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.appthem,
                          ))
                        : myproperties.errorLoadingPropertise.value != ''
                            ? Center(
                                child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            myproperties.getPropertise(11);
                                          },
                                          icon: const Icon(
                                            Icons.refresh,
                                            color: AppColors.appthem,
                                          )),
                                      SizedBox(
                                        height: 1.0.h,
                                      ),
                                      Text(myproperties
                                          .errorLoadingPropertise.value),
                                    ],
                                  ),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2.75,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 13),
                                itemCount: myproperties
                                    .profilePropertiseModel.data!.length,
                                itemBuilder: (context, index) {
                                  return Obx(() => Container(
                                        decoration: myproperties.idslst
                                                .contains(myproperties
                                                    .profilePropertiseModel
                                                    .data![index]
                                                    .id)
                                            ? BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey.shade300,
                                              )
                                            : const BoxDecoration(),
                                        child: GestureDetector(
                                          onTap: () {
                                            myproperties.idslst.contains(
                                                    myproperties
                                                        .profilePropertiseModel
                                                        .data![index]
                                                        .id)
                                                ? myproperties.idslst.remove(
                                                    myproperties
                                                        .profilePropertiseModel
                                                        .data![index]
                                                        .id)
                                                : myproperties.idslst.add(
                                                    myproperties
                                                        .profilePropertiseModel
                                                        .data![index]
                                                        .id);
                                          },
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15.h,
                                                width: 30.w,
                                                child: Image.network(
                                                  "${AppUrls.baseUrl2}${myproperties.profilePropertiseModel.data![index].images[0]}",
                                                  fit: BoxFit.cover,
                                                ),
                                                // color: Colors.amber,
                                              ),
                                              Text(myproperties
                                                  .profilePropertiseModel
                                                  .data![index]
                                                  .name!),
                                            ],
                                          ),
                                        ),
                                      ));
                                }),
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFF92AEC6)),
                        onPressed: () {
                          myproperties.idslst.clear();
                          Get.back();
                        },
                        child: const Text('Cancel')),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color(0xFF92AEC6)),
                        onPressed: () {
                          myproperties.idslst.isEmpty
                              ? Fluttertoast.showToast(
                                  msg: 'Please select inventory')
                              : myproperties.shareInventory(
                                  widget.agentId, widget.customerId);
                        },
                        child: const Text('Share')),
                  ],
                )
              ],
            ),
          );
        });
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
      // print('event data: ${event!.data}');

      final data = json.decode(event!.data.toString());

      setState(() {
        chattController.chatModel.data!.add(Datum(
            message: data['message'],
            senderId: widget.customerId,
            id: int.parse(widget.agentId.toString())));
      });
    });
  }

  void sendmessagescroll() async {
    await Future.delayed(const Duration(milliseconds: 6000));

    chattController.scrollController.animateTo(
        chattController.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut);
  }

  void chatscroll() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    chattController.scrollController.animateTo(
        chattController.scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut);
  }
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
