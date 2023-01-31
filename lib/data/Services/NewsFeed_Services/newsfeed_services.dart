import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class NewsFeedService {
  static Future<dynamic> getNewsFeedAPI() async {
    // int limit = 15;
    //"http://realestate.tecrux.net/api/v1/Properties?_page=$pageKey&_limit=$limit"

    var url = "${AppUrls.baseUrl}${AppUrls.newsfeed}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return newsfeedModelFromJson(res.body);
      } else {
        //page++;
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //pagination news feed
  static Future<dynamic> getNewsFeedPagination(pageKey, limit) async {
    // var url =
    //     "${AppUrls.baseUrl}${AppUrls.newsfeed}?_page=$pageKey&_limit=$limit";
    //  "http://realestate.tecrux.net/api/v1/Properties?_limit=$limit&_page=$page"
    var res = await BaseClientClass.get(
        "http://realestate.tecrux.net/api/v1/Properties?_page=1=$pageKey&_limit=$limit",
        '');

    try {
      if (res is http.Response) {
        print("page jump ------------$pageKey");
        var data = newsfeedModelFromJson(res.body);
        // page++;
        return data;
      } else {
        //page++;
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
