import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

import '../Models/propertyby_city_model.dart';

class HomefilterServices {
  static Future<dynamic> filterProperties(catid, cityid) async {
    Map data = {
      "category_id": catid,
      "city_id": cityid,
    };

    var url = "${AppUrls.baseUrl}${AppUrls.homefilter}";
    var res = await BaseClientClass.post(url, data);
    try {
      if (res is http.Response) {
        return propertyByCityModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
