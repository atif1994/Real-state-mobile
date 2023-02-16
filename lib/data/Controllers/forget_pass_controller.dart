import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Services/forget_services/forget_services.dart';

import '../Models/forgetpass_model/forgetpass_model.dart';

class ForgetPassController extends GetxController {
  RxBool forgetpassLoading = false.obs;
  RxString forgetpassErr = ''.obs;
  var forgerPassModel = ForgetPassModel();

  getForgetPass(email) async {
    forgetpassLoading(false);
    var res = await ForgetPassServices.forgetPassServices(email);
    if (res is ForgetPassModel) {
      forgetpassLoading(false);
      forgerPassModel = res;

      Fluttertoast.showToast(msg: forgerPassModel.message.toString());
      return res;
    } else {
      forgetpassErr.value = res.toString();
      return res;
    }
  }
}
