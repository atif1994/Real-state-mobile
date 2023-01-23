import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Services/local_notifications_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import '../../Models/Notification_Model/Notification_model.dart';
import '../../Models/Notification_Model/notification_model.dart';
import '../../Services/Notification_Services/notification_services.dart';

class Notificationcontroller extends GetxController {
  int? userid;
  RxBool loadingNotification = false.obs;
  var notificationModel = NotificationModel();
  RxString errorLoadingnotification = ''.obs;
  @override
  void onInit() {
    getNotifications(userid);
    getUserid();
    // getPrpertyCitis();
    print("notification ================>>>>>>>>>>>>>>========");
    // getNotificationsWithoutPerm();
    super.onInit();
  }

  void getUserid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid = pref.getInt("userid");

    print(".................$userid");
  }

  void getNotifications(userid) async {
    loadingNotification.value = true;
    errorLoadingnotification.value = '';
    var res = await NotificationsServices.getNotificationsServices();
    loadingNotification.value = false;
    if (res is NotificationModel) {
      notificationModel = res;

      showNotification();
    } else {
      loadingNotification.value = false;
      errorLoadingnotification.value = res.toString();
    }
  }

  void showNotification() {
    for (int i = 0; i < notificationModel.data!.length; i++) {
      LocalNotificationsApi.showNotifications(
          title: "Prologics Notification",
          body: notificationModel.data![i]!.description,
          payload: 'real.state a');
    }
  }
}
