import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/user_profile_section_model/revoke_control_model.dart';
import '../../Models/user_profile_section_model/shared_inventories_model.dart';

class ShareInventoryServices {
  static Future<dynamic> getShareInventory(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getsharedinventory}$uid";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return getShareInventoryResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

//-------------Revoke Control
  static Future<dynamic> revokeControl(int uid, String aid, String pid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.revokecontrol}";
    Map data = {'customer_id': uid, 'agent_id': aid, 'property_id': pid};
    var res = await BaseClientClass.post(url, data);

    try {
      if (res is http.Response) {
        return revokeControlResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
