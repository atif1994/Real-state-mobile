import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;

import '../../Models/user_profile_section_model/profile_updated.dart';

class UpdateProfileServices {
  static Future<dynamic> updateUserProfile(String fname, String lname,
      String pno, String desc, String email, String bday, String gender) async {
    Map data = {
      "first_name": fname,
      "last_name": lname,
      "phone": pno,
      "avatar_id": 8,
      "state": "KPK",
      "city": "pindi",
      "country": "Pakistan"
    };
    var url = "${AppUrls.baseUrl}${AppUrls.updateUserProfile}11";
    var res = await BaseClientClass.post(url, data);

    try {
      if (res is http.Response) {
        return updateprofileFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
