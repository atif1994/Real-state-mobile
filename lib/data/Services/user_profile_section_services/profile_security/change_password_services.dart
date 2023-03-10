//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;
import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../../utils/constants/app_urls.dart';
import '../../../Models/user_profile_section_model/security_related_models/change_password_model.dart';

class ChangePasswordServices {
  static Future<dynamic> profilechangePassword(
      int uid, String password, String oldPass) async {
    Map data = {"password": password, "old_password": oldPass};
    var url = "${AppUrls.baseUrl}${AppUrls.changePassword}$uid";
    var res = await BaseClientClass.post(url, data);

    try {
      if (res is http.Response) {
        return changePasswordResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
