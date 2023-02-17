import 'package:prologic_29/data/Models/agent_model/assign_agents_response.dart';
import 'package:prologic_29/data/Models/comments_models/get_comments.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetCommentService {
  static Future<dynamic> assignAgents(
    int pid,
  ) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.getComments}$pid";
      var res = await BaseClientClass.post(url, "");

      if (res is http.Response) {
        return getCommentsResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
