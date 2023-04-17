import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/services/expired_properties_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/expired_post_model.dart';

class ExpiredPropertyController extends GetxController {
  RxBool expiredpost = false.obs;
  RxString expiredpostmsg = ''.obs;
  var expiredproperties = Expiredproperties();
  int? uid;

  @override
  void onInit() {
    expiredpost.value = true;
    load();
    // TODO: implement onInit
    super.onInit();
  }

  void load() async {
    // await Future.delayed(const Duration(seconds: 2));
    getUserId();
    await Future.delayed(const Duration(seconds: 1));
    expiredproperty(11);
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  expiredproperty(int uid) async {
    expiredpost.value = true;
    expiredpostmsg.value = '';

    var res = await ExpiredProperties.showexpiredpost(uid);
    if (res is Expiredproperties) {
      expiredpost.value = false;
      expiredproperties = res;
      return res;
    } else {
      expiredpost.value = false;
      expiredpostmsg = res;
    }
  }
}
