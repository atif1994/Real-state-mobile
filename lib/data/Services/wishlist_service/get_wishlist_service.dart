import 'package:get/get.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import '../../Models/wishlist_model/get_wishlist_model.dart';

class GetWishlistService {
  static Future<dynamic> getWishlist(int uid) async {
    try {
      var url = '${AppUrls.baseUrl}${AppUrls.getWishlist}$uid';
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return getWishlistModelFromJson(res.body);
      } else {
        return;
      }
    } catch (e) {
      return e;
    }
  }
}
