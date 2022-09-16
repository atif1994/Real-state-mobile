import 'package:get/get.dart';
import '../Services/my_shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isSignedIn = false.obs;
  RxBool isSignInScreen = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isUserSignedIn();
  }

  void isUserSignedIn() async {
    isSignedIn(await MySharedPreferences.getUserData().then((value) => value.userId != 0 ? true : false));
  }
}