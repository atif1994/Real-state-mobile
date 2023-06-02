import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Referrals/get_all_referral.dart';
import '../../Services/Referals/get_all_referrals.dart';

class GetRefferal extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getrefferalload.value = true;

    getId();
  }

  int? uid;
  void getId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
    await Future.delayed(const Duration(seconds: 1));
    getrefferal();
  }

  RxBool getrefferalload = false.obs;
  RxString getrefferalerrormsg = ''.obs;
  Referral referral = Referral();

  getrefferal() async {
    getrefferalerrormsg.value = '';
    var res = await GetAllReferral.getallreferral(uid!);
    if (res is Referral) {
      getrefferalload.value = false;
      referral = res;
    } else {
      getrefferalload.value = false;
      getrefferalerrormsg.value = res.toString();
    }
  }
}
