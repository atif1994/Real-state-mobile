import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

class ChatServices {
  static Future<dynamic> getConversationService() async {
    var url = "${AppUrls.baseUrl}${AppUrls.convesationList}";
    var res = await BaseClientClass.get(url, '');
    try {
      if (res is http.Response) {
        return conversationFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //chat Screen API

  static Future<dynamic> getChatServiceAPI(int conversationId) async {
    var url = "${AppUrls.baseUrl}${AppUrls.chatList}$conversationId";
    var res = await BaseClientClass.get(url, '');
    try {
      if (res is http.Response) {
        return chatModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //Send msg API

  static Future<dynamic> sendMsgService() async {
    Map chat = {
      "customer": 11,
      "agent": 2,
      "message": "hdsdff",
      "conversation_id": 1
    };
    var url = "${AppUrls.baseUrl}${AppUrls.sendChat}";
    var res = await BaseClientClass.post(url, chat);
    try {
      if (res is http.Response) {
        return sendChatModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
