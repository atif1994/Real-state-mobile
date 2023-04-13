import 'package:get/get.dart';

import '../Models/propertypost_model.dart';
import '../Services/propertypost_service.dart';

class PropertyPostController extends GetxController {
  RxBool loadingpropertypost = false.obs;
  RxString errorloadingpropertypost = ''.obs;
  Propertypost propertypostmodel = Propertypost();

  int page = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getplacesdata();
  }

  getplacesdata() async {
    loadingpropertypost.value = true;
    errorloadingpropertypost.value = '';

    var res = await GetPropertiesServices.getpropertypost();

    if (res is Propertypost) {
      loadingpropertypost.value = false;
      propertypostmodel = res;
      return res;
    } else {
      errorloadingpropertypost.value = res.toString();
      loadingpropertypost.value = false;
    }
    update();
  }
}
