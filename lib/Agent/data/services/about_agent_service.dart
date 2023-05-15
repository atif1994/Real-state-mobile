import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/about_agent_model.dart';

class GetAboutAgentService {
  static Future<dynamic> aboutAgent(int aid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.aboutAgent}$aid";
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return aboutagentFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
