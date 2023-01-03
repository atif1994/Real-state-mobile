import 'dart:convert';
import 'package:dio/dio.dart';

class ImageService {
  static Future<dynamic> uploadFile(filePath) async {
    var authToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbTEyM0BnbWFpbC5jb20iLCJzdWIiOiI2MDViOTgxZDRkOTk4YjMxMjRhODEyMDQiLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTgyMzQ4NjUsImV4cCI6MTYxODMyMTI2NX0.lYUfZ20TlFZZQO_1JKZbKYZublPRoejqnmxKOAM9CN0';

    var userId = '605b981d4d998b3124a81204';

    try {
      FormData formData = FormData.fromMap(
          {"image": await MultipartFile.fromFile(filePath, filename: "dp")});

      Response response = await Dio().put("realestate.tecrux.net/api/v1/me/11",
          data: formData,
          options: Options(headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          }));
      print(response.data);
      var res = jsonDecode(response.data);

      print(res);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
