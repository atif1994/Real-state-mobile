import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

import '../../Models/post_like_response/post_like_response.dart';

class PostLikeServices {
  static Future<dynamic> getPostLikeServicee(String id, int uid) async {
    Map data = {"property_id": id, "user_id": uid};

    var url = "${AppUrls.baseUrl}${AppUrls.postLikee}";
    var res = await BaseClientClass.post(url, data);
    try {
      if (res is http.Response) {
        return postLikeResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
