import 'package:prologic_29/data/Models/get_all_citiese/get_all_citise_response.dart';

import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;

class GetAllCitiseServices {
  static Future<dynamic> getAllCitise() async {
    var url = "${AppUrls.baseUrl}${AppUrls.getAllCitise}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return getAllCitiseResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
