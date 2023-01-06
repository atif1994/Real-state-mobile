import 'package:get/get.dart';
import '../Controllers/auth_controller.dart';
import '../Controllers/search_controller.dart';
import '../Controllers/sign_in_controller.dart';
import '../Controllers/sign_up_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
    Get.put(AuthController());
    Get.put(SignInController());
    Get.put(SignUpController());
  }
}
