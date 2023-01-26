import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString fname = 'Muhammad'.obs;
  RxString lname = 'Khalid'.obs;
  RxString email = 'Sameer@23'.obs;
  RxString phone = '03002345768'.obs;
  RxString city = 'Rawalpindi'.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  void getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    fname.value = preferences.getString("fname") ?? "";
    lname.value = preferences.getString("lname") ?? "";
    email.value = preferences.getString("email") ?? "";
    phone.value = preferences.getString("phone") ?? "";
    city.value = preferences.getString("cityName") ?? "";
  }
}
