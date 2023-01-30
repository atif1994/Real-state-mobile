import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/get_user_profile.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/user_profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileController extends GetxController {
  RxBool loadingUserProfile = false.obs;
  RxString errorLoadingUserProfile = ''.obs;
  var userProfileData = GetUserProfileResponse();
  int uid = 0;

  @override
  void onInit() {
    load();
    super.onInit();
  }

  void load() async {
    getUserId();
    await Future.delayed(const Duration(seconds: 2));
    getUserProfile(uid);
  }

///////////////////////////////////////////////////
  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid")!;
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  ///////////////////////////////////////////////////////////////
  void getUserProfile(int uid) async {
    loadingUserProfile.value = true;
    errorLoadingUserProfile.value = "";

    var res = await USerProfileServices.getUserProfile(uid);

    if (res is GetUserProfileResponse) {
      userProfileData = res;
    } else {
      errorLoadingUserProfile.value = res;
      loadingUserProfile.value = false;
    }
  }
}
