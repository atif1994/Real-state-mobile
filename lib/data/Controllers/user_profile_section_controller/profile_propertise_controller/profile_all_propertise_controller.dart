import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/property_related_models/profile_mypropertise_response.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/profile_propertise/profile_my_propertise_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/user_profile_section_model/property_related_models/share_inventorymodel.dart';

class ProfilePropertiseController extends GetxController {
  RxBool loadingPropertise = false.obs;
  RxString errorLoadingPropertise = ''.obs;
  int? userid;
  RxList idslst = [].obs;
  var profilePropertiseModel = ProfileMyPropertiseResponse();
  var shareinventoryModel = ShareInventory();

  @override
  void onInit() {
    loadingPropertise.value = true;
    loadData();
    super.onInit();
  }

  void loadData() async {
    getUserId();
    await Future.delayed(const Duration(milliseconds: 400));
    getPropertise(userid ?? 0);
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid = pref.getInt("userid");
  }

  void getPropertise(int pid) async {
    errorLoadingPropertise.value = '';
    loadingPropertise.value = true;

    var res = await ProfileMyPropertise.getAppPropertise(pid);
    loadingPropertise.value = false;
    if (res is ProfileMyPropertiseResponse) {
      profilePropertiseModel = res;
    } else {
      errorLoadingPropertise.value = res.toString();
      loadingPropertise.value = false;
    }
  }

  void shareInventory(agentid, cusid) async {
    var res = await ProfileMyPropertise.shareInventory(agentid, cusid, idslst);
    if (res is ShareInventory) {
      shareinventoryModel = res;
    } else {
      errorLoadingPropertise.value = res.toString();
    }
    Fluttertoast.showToast(msg: shareinventoryModel.message.toString());
  }
}
