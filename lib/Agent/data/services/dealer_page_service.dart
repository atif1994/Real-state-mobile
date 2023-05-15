import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../models/dealer_page_model.dart';

class DealerPageService {
  static Future<dynamic> showDealerPage(int uid) async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.dealerPage}$uid";
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return dealerpageFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
