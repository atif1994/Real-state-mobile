import 'package:get/get.dart';

import '../Models/more_places_model.dart';
import '../Services/more_places_service.dart';

class MorePlacesController extends GetxController {
  RxBool loadingmoreplaces = false.obs;
  RxString errorloadingmoreplaces = ''.obs;

  NewsfeedModel moreplaceresponse = NewsfeedModel();

  int page = 0;

  @override
  void onInit() {
    super.onInit();
    getplacesdata();
  }

  getplacesdata() async {
    loadingmoreplaces.value = true;
    errorloadingmoreplaces.value = '';

    var res = await GetPropertiesServices.getproperties();

    if (res is NewsfeedModel) {
      loadingmoreplaces.value = false;
      moreplaceresponse = res;
      return res;
    } else {
      errorloadingmoreplaces.value = res.toString();
      loadingmoreplaces.value = false;
    }
    update();
  }
}
