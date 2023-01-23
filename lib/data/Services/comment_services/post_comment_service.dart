import 'package:prologic_29/data/Models/post_comments_model/post_comments_response.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class PostCommentServices {
  static Future<dynamic> postComments(
      String id, int uid, String comments) async {
    Map data = {"property_id": id, "user_id": uid, "comment": comments};

    var url = "${AppUrls.baseUrl}${AppUrls.postComments}";
    var res = await BaseClientClass.post(url, data);
    try {
      if (res is http.Response) {
        return postCommentsResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
