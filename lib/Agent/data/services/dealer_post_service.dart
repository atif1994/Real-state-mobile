import 'dart:convert';
import 'dart:io';

import 'package:prologic_29/Agent/data/models/dealer_post_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class DealerPostService {
  static Future<dynamic> addDealerPost(int uid, String title, String desc,
      String loc, List<dynamic> tags, File file) async {
    List<int> fileBytes = await file.readAsBytes();
    String base64File = base64Encode(fileBytes);
    String extension = path.extension(file.path);
    String extensionWithoutDot = extension.substring(1);
    Map data = {
      "user_id": uid,
      "description": desc,
      "location": loc,
      "title": title,
      "tags_list": tags,
      "ad_image": "data:image/$extensionWithoutDot;base64,$base64File"
    };
    try {
      var url = "${AppUrls.baseUrl}${AppUrls.newspost}";
      var res = await BaseClientClass.post(url, data);
      if (res is http.Response) {
        return dealerResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
