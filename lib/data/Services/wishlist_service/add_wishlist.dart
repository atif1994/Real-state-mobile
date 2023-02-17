import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/wishlist_model/add_wishist_model.dart';

class AddWishlistService {
  static Future<dynamic> addwishlistAgents(int uid, List<dynamic> pid) async {
    print("<<<<<<<<<<<<<<<$pid");
    Map data = {"user_id": uid, "propertylist": pid};
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.storewishlist}";
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return addWishlistModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
