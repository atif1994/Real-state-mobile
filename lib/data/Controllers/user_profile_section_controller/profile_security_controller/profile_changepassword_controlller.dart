import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/user_profile_section_model/security_related_models/change_password_model.dart';
import '../../../Services/user_profile_section_services/profile_security/change_password_services.dart';

class ChangePasswordController extends GetxController {
  RxBool loadingchangepassword = false.obs;
  RxString errorloadingchangepassword = ''.obs;
  int? uid;
  var profilechangepassword = ChangePasswordResponse();

  @override
  void onInit() {
    super.onInit();
    getuserid();
  }

  void getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getInt('userid');
  }

  void changepassword(String password) async {
    loadingchangepassword = true.obs;
    errorloadingchangepassword = ''.obs;

    var res =
        await ChangePasswordServices.profilechangePassword(uid!, password);

    if (res is ChangePasswordResponse) {
      print(uid);
      profilechangepassword = res;
      Fluttertoast.showToast(msg: profilechangepassword.message.toString());
    } else {
      errorloadingchangepassword.value = res;
      loadingchangepassword.value = false;
    }
  }
}
