import 'dart:convert';

import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import '../../Models/propertyby_city_model.dart';

class PropertyByCityService {
  static List<ImagesModel> imagesList = [];
  static Future<dynamic> getPropertyByCityService(int cityId) async {
    var url = "${AppUrls.baseUrl}${AppUrls.propertyByCity}$cityId";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        // var rawData = jsonDecode(res.body);
        // List list = rawData['data']['data'];
        // for (var element in list) {
        //   imagesList
        //       .add(ImagesModel(element['images']['1'], element['images']['2']));
        //   print("city list-------${imagesList[0].img2}");
        // }
        return propertyByCityModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  // static Future<dynamic> getPropertyByCityServiceImages(int cityId) async {
  //   var url = "${AppUrls.baseUrl}${AppUrls.propertyByCity}$cityId";
  //   var res = await BaseClientClass.get(url, '');
  //   List<ImagesModel> imagesList = [];

  //   try {
  //     if (res is http.Response) {
  //       var rawData = jsonDecode(res.body);
  //       List list = rawData['data']['data'];
  //       for (var element in list) {
  //         imagesList
  //             .add(ImagesModel(element['images']['1'], element['images']['2']));
  //         print("city list-------${imagesList[0].img2}");
  //       }
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }
}

class ImagesModel {
  String? img1;
  String? img2;
  ImagesModel(this.img1, this.img2);
}
