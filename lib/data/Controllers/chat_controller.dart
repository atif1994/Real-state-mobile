import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';

import '../Services/chat_services.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getConversation();
    getChat();
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
      loadingConversation.value = false;
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

  void getChat() async {
    loadingChat.value = true;
    errChatload.value = '';
    var res = await ChatServices.getChatServiceAPI();
    loadingChat.value = false;
    if (res is ChatModel) {
      loadingChat.value = false;
      chatModel = res;
    } else {
      loadingChat.value = false;
      errChatload.value = res.toString();
    }
  }
}
