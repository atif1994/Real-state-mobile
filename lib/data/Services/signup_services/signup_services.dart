import 'package:prologic_29/utils/constants/base_client.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

import '../../Models/signup_model/signup_model.dart';

class SignupServices {
  static Future<dynamic> signupServices(
    email,
    pass,
    username,
    fname,
    lname,
    country,
    state,
    city,
    phone,
    role
  ) async {
    Map data = {
      "email": email,
      "password": pass,
      "username": username,
      "first_name": fname,
      "last_name": lname,
      "country": country,
      "state": state,
      "city": city,
      "phone": phone,
      "role_id": 4,
      "role":role
    };

    var url = "${AppUrls.baseUrl}${AppUrls.postLikee}";
    var res = await BaseClientClass.post(
        "https://realestate.tecrux.solutions/api/v1/register", data);
    try {
      if (res is http.Response) {
        return signupModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
