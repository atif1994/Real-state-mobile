import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/property_model/featured_propertise_response.dart';

class FeaturedPropertyService {
  static Future<dynamic> getFeaturedPropertiser() async {
    var url = "${AppUrls.baseUrl}${AppUrls.featuredProperty}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return featuredPropertiseModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
