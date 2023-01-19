import '../../../utils/constants/app_urls.dart';
import '../../../utils/constants/base_client.dart';
//import '../../Models/Notification_Model/Notification_model.dart';
import 'package:http/http.dart' as http;

import '../../Models/Notification_Model/notification_model.dart';

class NotificationsServices {
  static Future<dynamic> getNotificationsServices() async {
    var url = "${AppUrls.baseUrl}${AppUrls.notificationend}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return notificationModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
