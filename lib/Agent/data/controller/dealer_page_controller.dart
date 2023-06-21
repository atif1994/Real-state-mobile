import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/services/dealer_page_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/dealer_page_model.dart';

class DealerPageController extends GetxController {
  RxBool loadingShowPost = false.obs;
  RxString errorShowPost = ''.obs;
  int? uid;
  var dealerPageModel = Dealerpage();

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
    await Future.delayed(const Duration(seconds: 1));
    showDealerPage();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadingShowPost.value = true;

    getUserId();
  }

  void showDealerPage() async {
    loadingShowPost.value = true;
    errorShowPost.value = '';

    var res = await DealerPageService.showDealerPage(uid!);
    loadingShowPost.value = false;
    if (res is Dealerpage) {
      dealerPageModel = res;
    } else {
      loadingShowPost.value = false;
      errorShowPost.value = res.toString();
    }
  }
}
