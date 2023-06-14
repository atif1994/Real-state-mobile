import 'package:http/http.dart' as http;
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../Models/agent_shared_inventory_model.dart';
import '../Models/more_places_model.dart';

class AgentSharedInventoryServices {
  static Future<dynamic> getSharedInventory(int aid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.agentsharedinventory}$aid";
      var res = await BaseClientClass.get(url, '');

      if (res is http.Response) {
        return agentSharedInventoryResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
