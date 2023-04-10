import 'package:get/get.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:prologic_29/data/Services/send_chat_services/send_chat_services.dart';

class SendChatController extends GetxController {
  RxBool loadingSendChat = false.obs;
  RxString errSendChat = ''.obs;
  RxBool showbutton = false.obs;
  var sendChatModel = SendChatModel();

  getSendChatApi({userId, agentId, msg}) async {
    loadingSendChat.value = true;
    var res = await SendChatServices.sendChatApi(userId, agentId, msg);
    if (res is SendChatModel) {
      loadingSendChat.value = false;
      showbutton.value = true;
      sendChatModel = res;
    } else {
      loadingSendChat.value = false;
      errSendChat.value = res.toString();
    }
  }
}
