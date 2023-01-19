import 'package:prologic_29/data/Services/Contact_us_services/contact_us_response_model.dart';

import '../../../utils/constants/app_urls.dart';

import 'package:http/http.dart' as http;

import '../../../utils/constants/base_client.dart';

class ContactUsServices {
  static Future<dynamic> getContactUsServices(String name, String email,
      String subject, String phone, String content) async {
    Map data = {
      "name": name,
      "email": email,
      "subject": subject,
      "phone": phone,
      "content": content,
    };
    var url = "${AppUrls.baseUrl}${AppUrls.contacusend}";
    var res = await BaseClientClass.post(url, data);

    try {
      if (res is http.Response) {
        return contactUsResponseModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
