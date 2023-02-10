import 'dart:convert';

import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../Models/wishlist_model.dart';

class ShowWishlistService {
  static Future<dynamic> showWishlist(List<dynamic> ids) async {
    Map data = {"properties": ids};
    try {
      var url = '${AppUrls.baseUrl}${AppUrls.getWishlist}';
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return wishlistResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<void> getWishlist() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://realestate.tecrux.solutions/api/v1/wishlist'));
    request.body = json.encode({
      "properties": [173, 172, 171]
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      //  var data = jsonDecode();
    } else {
      print(response.reasonPhrase);
    }
  }
}
