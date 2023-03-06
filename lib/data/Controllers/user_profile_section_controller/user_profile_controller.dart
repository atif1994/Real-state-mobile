import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/get_user_profile.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/user_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileController extends GetxController {
  @override
  void onInit() {
    loadingUserProfile.value = true;
    load();
    // TODO: implement onInit
    super.onInit();
  }

  RxBool loadingUserProfile = false.obs;

  RxString errorLoadingUserProfile = ''.obs;
  var userProfileData = GetUserProfileResponse();
  int? uid;

  void load() async {
    // await Future.delayed(const Duration(seconds: 2));
    getUserId();
    await Future.delayed(const Duration(seconds: 1));
    getUserProfile(uid ?? 0);
  }

///////////////////////////////////////////////////
  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  ///////////////////////////////////////////////////////////////
  void getUserProfile(int uid) async {
    loadingUserProfile.value = true;
    errorLoadingUserProfile.value = "";

    var res = await USerProfileServices.getUserProfile(uid);
    loadingUserProfile.value = false;
    if (res is GetUserProfileResponse) {
      loadingUserProfile.value = false;
      userProfileData = res;
    } else {
      loadingUserProfile.value = false;
      errorLoadingUserProfile.value = res.toString();
    }
    update();
  }
}
