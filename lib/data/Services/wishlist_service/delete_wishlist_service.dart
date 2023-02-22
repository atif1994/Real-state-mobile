import 'package:flutter/material.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/wishlist_model/delete_wishlist_model.dart';

class DelWishlistService {
  static Future deletewishlist(pid, uid) async {
    Map data = {"property_id": pid, "user_id": uid};
    var url = "${AppUrls.baseUrl}${AppUrls.delWishlist}";
    try {
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return deletePropertiesResponseFromJson(res.body);
      } else {
        return;
      }
    } catch (e) {
      return e;
    }
  }
}
