import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/comment_model.dart';

class NewsFeedCommentService {
  static Future<dynamic> getNewsFeedCommentAPI() async {
    Map data = {"property_id": "2", "comment": "niceeerer"};
    var url = "${AppUrls.baseUrl}${AppUrls.newsfeedcomment}";
    var res = await BaseClientClass.post(url, data);

    try {
      if (res is http.Response) {
        return newsfeedCommenttFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
