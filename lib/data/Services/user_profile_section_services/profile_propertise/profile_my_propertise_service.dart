import 'package:prologic_29/data/Models/user_profile_section_model/property_related_models/profile_mypropertise_response.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../../Models/user_profile_section_model/property_related_models/share_inventorymodel.dart';

class ProfileMyPropertise {
  static Future<dynamic> getAppPropertise(int pid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.profileAllPropertise}$pid";
      var res = await BaseClientClass.get(url, "");

      if (res is http.Response) {
        return profileMyPropertiseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> shareInventory(
      String agentid, String cusid, List<dynamic> proids) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.shareInventory}";
      Map data = {
        "agent_id": agentid,
        "property_ids": proids,
        "customer_id": cusid
      };
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return shareInventoryFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
