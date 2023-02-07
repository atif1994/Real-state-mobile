import 'package:prologic_29/data/Models/agent_model/assign_agents_response.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class AssignAgentService {
  static Future<dynamic> assignAgents(int pid, List<dynamic> agents) async {
    Map data = {"property_id": pid, "agents": agents};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.assignAgents}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return assignAgentResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
