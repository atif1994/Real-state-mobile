import 'package:get/get.dart';
import 'package:prologic_29/data/Services/forget_services/forget_services.dart';
import 'package:prologic_29/utils/constants/easyloading.dart';

import '../Models/forgetpass_model/forgetpass_model.dart';

class ForgetPassController extends GetxController {
  RxBool forgetpassLoading = false.obs;
  RxString forgetpassErr = ''.obs;
  var forgerPassModel = ForgetPassModel();

  getForgetPass(email) async {
    // forgetpassLoading(false);
    AppEasyloading.apploading();
    var res = await ForgetPassServices.forgetPassServices(email);
    if (res is ForgetPassModel) {
      // forgetpassLoading(false);

      forgerPassModel = res;
      AppEasyloading.apptoastshow(forgerPassModel.message.toString());
      return res;
    } else {
      forgetpassErr.value = res.toString();
      AppEasyloading.apperrormsg('Error, Try Again');

      return res;
    }
  }
}
