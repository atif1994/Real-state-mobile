import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Services/Agent%20Shared%20InventoryService/agent_shared_inventories_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/agent_shared_inventory_model.dart';

class AgentShareInventoryController extends GetxController {
  RxBool loadingAgentShareInventory = false.obs;
  RxString errorLoadingAgentShareInventory = ''.obs;

  var ShareInventoryData = AgentSharedInventoryResponse();
  int? uid;
  @override
  void onInit() {
    loadingAgentShareInventory.value = true;
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
    loadingAgentShareInventory.value = true;
    errorLoadingAgentShareInventory.value = "";

    var res = await AgentSharedInventoryServices.getSharedInventory(uid!);
    loadingAgentShareInventory.value = false;
    if (res is AgentSharedInventoryResponse) {
      loadingAgentShareInventory.value = false;
      ShareInventoryData = res;
    } else {
      loadingAgentShareInventory.value = false;
      errorLoadingAgentShareInventory.value = res.toString();
    }
  }
}
