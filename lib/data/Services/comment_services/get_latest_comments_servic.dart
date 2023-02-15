import 'package:prologic_29/data/Models/comments/get_latest_comments_response.dart';
import 'package:prologic_29/data/Models/post_comments_model/post_comments_response.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class GetCommentServices {
  static Future<dynamic> getComments(int pid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.getLatestComments}/$pid";
    var res = await BaseClientClass.get(url, "");
    try {
      if (res is http.Response) {
        return getCommentsModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
