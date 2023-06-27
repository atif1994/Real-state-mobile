// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/chat_services.dart';

class ConversationController extends GetxController {
  int? conversationId;
  int uid = 0;
  RxBool loadChat = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadingChat.value = true;
    loadingConversation.value = true;
    getUserId();
    loadChat.value = true;
    loadData();
  }

  // void loadChatFu() {
  //   Future.delayed(const Duration(seconds: 2));
  //   loadChat.value = false;
  // }

  void loadData() async {
    getUserId();
    getConversationId();

    await Future.delayed(const Duration(milliseconds: 200));

    getConversation(uid);
    getChat(conversationId!);

    // await Future.delayed(const Duration(milliseconds: 200));
    // getChat(conversationId ?? 0);
    // print("conversational Id =======????$conversationId ");
  }

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid") ?? 0;
    print("************************$uid");
  }

  RxBool loadingConversation = false.obs;
  var conversationModel = Conversation();
  RxString errConversationLoad = ''.obs;
  List<Chat> allConversation = [];
  getConversation(int uid) async {
    print("*****user id call in func*******************$uid");
    loadingConversation.value = true;
    errConversationLoad.value = '';
    var res = await ConversationServices.getConversationService(uid);
    if (res is Conversation) {
      loadingConversation.value = false;
      loadingChat.value = false;
      conversationModel = res;
      // for (int i = 0; i < conversationModel.data![1].chats!.length; i++) {
      //   allConversation.add(conversationModel.data![i].chats![i]);

      //   print('*****************************${allConversation[i].message}');
      // }
    } else {
      loadingConversation.value = false;
      errConversationLoad.value = res.toString();
      update();
    }
  }

  final ScrollController scrollController = ScrollController();

//Chat Screen Controller

  RxBool loadingChat = false.obs;
  var chatModel = ChatModel();
  RxString errChatload = ''.obs;
  getChat(int conversationId) async {
    // loadChat.value = true;
    loadingChat.value = true;
    var res = await ConversationServices.getChatServiceAPI(conversationId);
    if (res is ChatModel) {
      loadChat.value = false;
      loadingChat.value = false;
      chatModel = res;
      await Future.delayed(const Duration(milliseconds: 1000));
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
    } else {
      loadingChat.value = false;
      loadChat.value = false;
      errChatload.value = res.toString();
    }
    update();
  }

//get convesationId from sharedPref had store from chat room

  void getConversationId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    conversationId = pref.getInt("conversatinId");
  }

// send msg Controller

  RxBool loadingsend = false.obs;
  var sendMsgModel = SendChatModel();
  RxString errSendMsg = ''.obs;

  void sendMsgMethod(custId, agentId, msg, convId) async {
    loadingsend.value = true;
    errSendMsg.value = '';
    var res = await ConversationServices.sendMsgService(
        custId, agentId, msg, convId, uid);
    loadingsend.value = false;
    if (res is SendChatModel) {
      sendMsgModel = res;
    } else {
      loadingsend.value = false;
      errSendMsg.value = res.toString();
    }
    update();
  }
}
