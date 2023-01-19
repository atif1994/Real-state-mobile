import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/property_model/property_by_id_model.dart';

class PropertyByIDService {
  static Future<dynamic> getPropertyById(int pid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.propertyByID}$pid";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return propertyByIdFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
