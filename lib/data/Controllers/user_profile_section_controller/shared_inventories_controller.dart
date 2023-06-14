import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/user_profile_section_model/revoke_control_model.dart';
import '../../Models/user_profile_section_model/shared_inventories_model.dart';
import '../../Services/user_profile_section_services/shared_inventories_services.dart';

class ShareInventoryController extends GetxController {
  RxBool loadingShareInventory = false.obs;
  RxString errorLoadingShareInventory = ''.obs;

  RxBool loadingRevokeControl = false.obs;
  RxString errorLoadingRevokeControl = ''.obs;

  var ShareInventoryData = GetShareInventoryResponse();
  int? uid;
  @override
  void onInit() {
    loadingShareInventory.value = true;
    load();
    // TODO: implement onInit
    super.onInit();
  }

  void load() async {
    getUserId();
    await Future.delayed(const Duration(seconds: 1));
    getShareInventory();
  }

///////////////////////////////////////////////////
  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("uid__________________________$uid");
    }
  }

  ///////////////////////////////////////////////////////////////
  void getShareInventory() async {
    loadingShareInventory.value = true;
    errorLoadingShareInventory.value = "";

    var res = await ShareInventoryServices.getShareInventory(uid!);
    loadingShareInventory.value = false;
    if (res is GetShareInventoryResponse) {
      loadingShareInventory.value = false;
      ShareInventoryData = res;
    } else {
      loadingShareInventory.value = false;
      errorLoadingShareInventory.value = res.toString();
    }
  }

  ///////////////////////////////////////////////////////////////
  var RevokeControlModel = RevokeControlResponse();
  void postRevokeControl(String aid, String pid) async {
    loadingRevokeControl.value = true;
    errorLoadingRevokeControl.value = "";

    var res = await ShareInventoryServices.revokeControl(uid!, aid, pid);
    loadingRevokeControl.value = false;
    if (res is RevokeControlResponse) {
      loadingRevokeControl.value = false;
      RevokeControlModel = res;
      Fluttertoast.showToast(msg: res.message.toString());
      getShareInventory();
    } else {
      loadingRevokeControl.value = false;
      errorLoadingRevokeControl.value = res.toString();
    }
  }
}
