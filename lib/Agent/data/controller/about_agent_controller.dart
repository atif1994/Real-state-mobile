import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/services/about_agent_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/about_agent_model.dart';

class AboutAgentController extends GetxController {
  int? uid;

  RxBool loadingAboutAgent = false.obs;
  RxString errorAboutAgent = ''.obs;
  var aboutAgentModel = Aboutagent();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadingAboutAgent.value = true;
    getUserId();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
    await Future.delayed(const Duration(seconds: 1));
    aboutAgent();
  }

  void aboutAgent() async {
    errorAboutAgent.value = '';

    var res = await GetAboutAgentService.aboutAgent(uid!);
    loadingAboutAgent.value = false;
    if (res is Aboutagent) {
      aboutAgentModel = res;
    } else {
      loadingAboutAgent.value = false;
      errorAboutAgent.value = res;
    }
  }
}
