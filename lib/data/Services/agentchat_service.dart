import '../../utils/constants/app_urls.dart';
import '../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../Models/Chat_Model/conversation_model.dart';

class AgentConversationServices {
  static Future<dynamic> getConversationService(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.agentconvesationList}$uid";
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
}
