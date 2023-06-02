import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Controllers/user_profile_section_controller/user_profile_controller.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/profile_updated.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/update_user_profile_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Views/Home/home.dart';

class UpdateProfileController extends GetxController {
  RxBool loadingUpdateProfile = false.obs;
  RxString errorLoadingUpdateProfile = ''.obs;
  var updateProfileData = Updateprofile();
  int? uid;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserId();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  ///////////////////////////////////////////////////////////////
  void updateUserProfile(String fname, String lname, String pno, String uname,
      String email, String bday, String gender) async {
    loadingUpdateProfile.value = true;
    errorLoadingUpdateProfile.value = "";

    var res = await UpdateProfileServices.updateUserProfile(
        uid!, fname, lname, pno, uname, email, bday, gender);

    if (res is Updateprofile) {
      loadingUpdateProfile.value = false;
      updateProfileData = res;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("fname", fname);
      preferences.setString("lname", lname);
      preferences.setString("email", email);
      Get.off(() => const Home());
      Get.delete<UserProfileController>();
      Fluttertoast.showToast(msg: res.message.toString());
    } else {
      loadingUpdateProfile.value = false;
      errorLoadingUpdateProfile.value = res;
    }
  }
}
