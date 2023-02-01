import 'package:prologic_29/data/Models/Chat_Model/chat_model.dart';
import 'package:prologic_29/data/Models/Chat_Model/conversation_model.dart';
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

  static Future<dynamic> getChatServiceAPI() async {
    var url = "${AppUrls.baseUrl}${AppUrls.chatList}";
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
}
