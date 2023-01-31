import 'package:prologic_29/data/Models/like_model.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

class PostLikeServices {
  static Future<dynamic> getPostLikeServicee(
      String propertyId, int userId) async {
    Map data = {"property_id": propertyId, "user_id": userId};

    var url = "${AppUrls.baseUrl}${AppUrls.postLikee}";
    var res = await BaseClientClass.post(url, data);
    try {
      if (res is http.Response) {
        return likeModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
