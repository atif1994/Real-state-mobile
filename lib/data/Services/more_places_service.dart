import 'package:http/http.dart' as http;
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../Models/more_places_model.dart';

class GetPropertiesServices {
  static Future<dynamic> getproperties(pageKey) async {
    try {
      var url =
          "${AppUrls.baseUrl3}${AppUrls.newsfeed}?_page=$pageKey&_limit=5";
      var res = await BaseClientClass.get(url, '');

      if (res is http.Response) {
        return allPropertiesResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
