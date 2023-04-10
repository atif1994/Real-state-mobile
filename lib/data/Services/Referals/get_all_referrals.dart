import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/Referrals/get_all_referral.dart';

class GetAllReferral {
  static Future<dynamic> getallreferral(int id) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.agentResferral}$id";
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return referralFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
