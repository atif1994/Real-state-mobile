import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';

import '../../Models/user_profile_section_model/image_update_model.dart';

class UpdateImageService {
  final http.Client _httpClient = http.Client();

  Future<dynamic> uploadFile(File file, int uid) async {
    var url = "${AppUrls.baseUrl}${AppUrls.updateUserImage}$uid";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('avatar', file.path));
    var res = await _httpClient.send(request).then(http.Response.fromStream);

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
  // static Future<dynamic> updateImage(File image, int uid) async {
  //   Map data = {"avatar": image};
  //   var url = "${AppUrls.baseUrl}${AppUrls.updateUserImage}$uid";
  //   var res = await BaseClientClass.post(url, data);
  //   try {
  //     if (res is http.Response) {
  //       return updateimageResponseFromJson(res.body);
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }
}
