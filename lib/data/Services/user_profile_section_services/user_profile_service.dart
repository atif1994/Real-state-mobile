import 'package:prologic_29/data/Models/user_profile_section_model/get_user_profile.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;

class USerProfileServices {
  static Future<dynamic> getUserProfile(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getUserProfile}$uid";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return getUserProfileResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
