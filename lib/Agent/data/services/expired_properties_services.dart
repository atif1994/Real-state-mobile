import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/expired_post_model.dart';

class ExpiredProperties {
  static Future<dynamic> showexpiredpost(int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getExpiredPost}$uid";
    var res = await BaseClientClass.get(url, '');
    try {
      if (res is http.Response) {
        return expiredpropertiesFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
