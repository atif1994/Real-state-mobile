import 'package:http/http.dart' as http;
import 'package:prologic_29/data/Models/propertypost_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

class GetPropertiesServices {
  static Future<dynamic> getpropertypost() async {
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.newspost}";
      var res = await BaseClientClass.get(url, '');

      if (res is http.Response) {
        return propertypostFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
