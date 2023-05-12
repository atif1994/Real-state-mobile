import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppEasyloading {
  static apploading() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.circle;
    EasyLoading.show(status: 'Loading');
  }

  static apptoastshow(msg) {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.showToast(msg);
  }

  static appsuccessmsg(msg) {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.showSuccess(msg);
  }

  static apperrormsg(msg) {
    EasyLoading.instance.maskType = EasyLoadingMaskType.black;
    EasyLoading.showError(msg);
  }
}
