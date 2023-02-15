import 'dart:convert';

import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import '../../Models/propertyby_city_model.dart';

class PropertyByCityService {
  static Future<dynamic> getPropertyByCityService(int cityId) async {
    var url = "${AppUrls.baseUrl}${AppUrls.propertyByCity}$cityId";
    var res = await BaseClientClass.get(url, '');

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
