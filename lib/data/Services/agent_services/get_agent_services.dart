import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/agent_model/get_agent_model.dart';

class AgentPropertise {
  static Future<dynamic> getAgents(int pid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getAllAgents}$pid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return getAgentResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
