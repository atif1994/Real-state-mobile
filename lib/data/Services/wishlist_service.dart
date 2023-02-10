import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../Models/wishlist_model.dart';

class getWishlistService {
  static Future<dynamic> wishlistservice(List<dynamic> ids) async {
    var data = {"properties": ids};
    try {
      var url = "${AppUrls.baseUrl3}${AppUrls.getWishlist}";
      var uri = await BaseClientClass.post(url, data);

      if (uri is http.Response) {
        return wishlistResponseFromJson(uri.body);
      } else {
        return uri;
      }
    } catch (e) {
      return e;
    }
  }
}
