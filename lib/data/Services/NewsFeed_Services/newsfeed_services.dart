import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class NewsFeedService {
  static Future<dynamic> getNewsFeedAPI() async {
    var url = AppUrls.newsfeed;
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return newsfeedModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
