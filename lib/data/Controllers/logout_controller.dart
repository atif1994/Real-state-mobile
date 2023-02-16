import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/my_shared_preferences.dart';

class LogoutController extends GetxController {
//signout
  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await MySharedPreferences.getUserData().then((value) => value.userId != 0);

    Get.off(SignIn());
    print("logout");
  }
}
