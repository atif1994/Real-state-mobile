import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // RxBool isSignedIn = false.obs;
  // RxBool isSignInScreen = true.obs;
  int? userId;
  String? urole;
  void alreadyCheckLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getInt("userid");
    urole = pref.getString("role");
  }

  //RxBool isSignUpScreen = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    alreadyCheckLogin();
    // isUserSignedIn();
  }

  // void isUserSignedIn() async {
  //   isSignedIn(await MySharedPreferences.getUserData()
  //       .then((value) => value.userId != 0 ? true : false));
  //   //isSignUpScreen(await MySharedPreferences.getUserData()
  //   //.then((value) => value.userId != 0 ? true : false));
  // }
}
