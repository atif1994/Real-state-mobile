import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/services/expired_properties_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/expired_post_model.dart';
import '../models/marksold_model.dart';
import '../models/repost_model.dart';

class ExpiredPropertyController extends GetxController {
  RxBool expiredpost = false.obs;
  RxString expiredpostmsg = ''.obs;
  var expiredproperties = Expiredproperties();
  var soldproperties = Soldproperties();
  var repostproperties = Repostproperties();
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
    expiredproperty(uid!);
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

  repostproperty(pid) async {
    var res = await ExpiredProperties.repost(pid);
    if (res is Repostproperties) {
      repostproperties = res;
      expiredproperty(uid!);
    } else {}

    Fluttertoast.showToast(msg: repostproperties.message.toString());
  }

  soldproperty(pid) async {
    var res = await ExpiredProperties.sold(pid);
    if (res is Soldproperties) {
      soldproperties = res;
      expiredproperty(uid!);
    } else {}
    Fluttertoast.showToast(msg: soldproperties.message.toString());
  }
}
