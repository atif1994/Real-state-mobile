import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../../Models/user_profile_section_model/image_update_model.dart';

class UpdateImageService {
  static Future<dynamic> updateImage(String image, int uid) async {
    Map data = {"avatar": jsonEncode(image)};
    var url = "${AppUrls.baseUrl}${AppUrls.updateUserImage}$uid";
    var res = await BaseClientClass.post(url, data);
    try {
      if (res is http.Response) {
        return updateimageResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
