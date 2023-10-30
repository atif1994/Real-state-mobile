import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:prologic_29/data/Services/send_chat_services/send_chat_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Views/user_profile/chat/chatting_screen.dart';

class SendChatController extends GetxController {
  RxBool loadingSendChat = false.obs;
  RxString errSendChat = ''.obs;
  RxBool showbutton = false.obs;
  int? uid;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserId();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  var sendChatModel = SendChatModel();

  getSendChatApi({agentid, convid, msg}) async {
    loadingSendChat.value = true;
    var res =
        await SendChatServices.sendChatApi(uid, agentid, uid, convid, msg);
    if (res is SendChatModel) {
      loadingSendChat.value = false;
      showbutton.value = true;
      sendChatModel = res;
      Get.to(() => Chating(
            checkid: 0,
            agentId: agentid.toString(),
            conId: sendChatModel.data![0].conversationId,
            customerId: uid.toString(),
            senderId: uid.toString(),
            name:
                "${sendChatModel.data![0].user!.firstName} ${sendChatModel.data![0].user!.lastName}",
          ));
    } else {
      loadingSendChat.value = false;
      errSendChat.value = res.toString();
    }+















  }
}
