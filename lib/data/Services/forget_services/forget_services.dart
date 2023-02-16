import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import '../../Models/forgetpass_model/forgetpass_model.dart';

class ForgetPassServices {
  static Future<dynamic> forgetPassServices(email) async {
    var url = "${AppUrls.baseUrl}${AppUrls.forgetpass}";
    var res = await BaseClientClass.post(url, {"email": "$email"});

    try {
      if (res is http.Response) {
        return forgetPassModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
