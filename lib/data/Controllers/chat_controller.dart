import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/chat_services.dart';

class ChatController extends GetxController {
  int? conversationId;
  int uid = 0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();
  }

  void loadData() async {
    getUserId();
    await Future.delayed(const Duration(milliseconds: 200));
    getConversation(uid);
    getConversationId();
    await Future.delayed(const Duration(seconds: 2));
    getChat(conversationId ?? 0);
    print("conversational Id =======????$conversationId ");
  }

  getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    uid = pref.getInt("userid") ?? 0;

    print("************************$uid");
  }

  RxBool loadingConversation = false.obs;
  var conversationModel = Conversation();
  RxString errConversationLoad = ''.obs;

  void getConversation(int uid) async {
    loadingConversation.value = true;
    errConversationLoad.value = '';
    var res = await ChatServices.getConversationService(uid);
    loadingConversation.value = false;
    if (res is Conversation) {
      conversationModel = res;
    } else {
      loadingConversation.value = false;
      errConversationLoad.value = res.toString();
    }
  }

//Chat Screen Controller

  RxBool loadingChat = false.obs;
  var chatModel = ChatModel();
  RxString errChatload = ''.obs;

  void getChat(int conversationId) async {
    loadingChat.value = true;
    var res = await ChatServices.getChatServiceAPI(conversationId);
    if (res is ChatModel) {
      loadingChat.value = false;
      chatModel = res;
    } else {
      loadingChat.value = false;
      errChatload.value = res.toString();
    }
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
    var res = await ChatServices.sendMsgService(custId, agentId, msg, convId);
    loadingsend.value = false;
    if (res is SendChatModel) {
      sendMsgModel = res;
    } else {
      loadingsend.value = false;
      errSendMsg.value = res.toString();
    }
  }
}
