import 'package:prologic_29/data/Models/Chat_Model/sendchat_model.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;

class SendChatServices {
  static Future<dynamic> sendChatApi(
      custId, agentId, senderid, convid, msg) async {
    print("api service--$custId:$agentId $msg");
    Map data = {
      "customer": custId,
      "agent": agentId,
      "message": msg.toString(),
      "conversation_id": convid,
      "sender_id": senderid
    };

    var url = "${AppUrls.baseUrl}${AppUrls.sendchat}";
    var res = await BaseClientClass.post(url, data);

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
