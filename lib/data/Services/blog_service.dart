import 'package:prologic_29/Agent/data/models/dealer_post_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class DealerPostService {
  static Future<dynamic> addDealerPost() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.dealerPost}";
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return dealerResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
