import 'package:get/get.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/profile_updated.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/update_user_profile_services.dart';

class UpdateProfileController extends GetxController {
  RxBool loadingUpdateProfile = false.obs;
  RxString errorLoadingUpdateProfile = ''.obs;
  var updateProfileData = Updateprofile();

  ///////////////////////////////////////////////////////////////
  void updateUserProfile(String fname, String lname, String pno, String desc,
      String email, String bday, String gender) async {
    loadingUpdateProfile.value = true;
    errorLoadingUpdateProfile.value = "";

    var res = await UpdateProfileServices.updateUserProfile(
        fname, lname, pno, desc, email, bday, gender);

    if (res is Updateprofile) {
      loadingUpdateProfile.value = false;
      updateProfileData = res;
    } else {
      loadingUpdateProfile.value = false;
      errorLoadingUpdateProfile.value = res;
    }
  }
}
