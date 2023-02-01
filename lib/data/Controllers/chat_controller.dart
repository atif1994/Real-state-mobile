import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/chat_services.dart';

class ChatController extends GetxController {
  int? conversationId;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();

    print("conversational Id =======????$conversationId ");
  }

  void loadData() async {
    getConversation();
    getConversationId();
    await Future.delayed(const Duration(seconds: 2));
    getChat(conversationId);
  }

  RxBool loadingConversation = false.obs;
  var conversationModel = Conversation();
  RxString errConversationLoad = ''.obs;

  void getConversation() async {
    loadingConversation.value = true;
    errConversationLoad.value = '';
    var res = await ChatServices.getConversationService();
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

  void getChat(int? conversationId) async {
    loadingChat.value = true;
    errChatload.value = '';
    var res = await ChatServices.getChatServiceAPI(conversationId!);
    loadingChat.value = false;
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

  void sendMsgMethod() async {
    loadingsend.value = true;
    errSendMsg.value = '';
    var res = await ChatServices.sendMsgService();
    loadingsend.value = false;
    if (res is SendChatModel) {
      sendMsgModel = res;
    } else {
      loadingsend.value = false;
      errSendMsg.value = res.toString();
    }
  }
}
