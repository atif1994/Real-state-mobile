import 'package:get/get.dart';

import '../Models/propertypost_model.dart';
import '../Services/propertypost_service.dart';

class PropertyPostController extends GetxController {
  RxBool loadingpropertypost = false.obs;
  RxString errorloadingpropertypost = ''.obs;
  RxBool loadingfilterpost = false.obs;
  RxString errorloadingfilterpost = ''.obs;
  Propertypost propertypostmodel = Propertypost();
  RxList lst1 = [].obs;
  RxBool showbtn = false.obs;
  int page = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getplacesdata("", "");
  }

  getplacesdata(location, aname) async {
    loadingpropertypost.value = true;
    errorloadingpropertypost.value = '';

    var res = await GetPropertiesServices.getpropertypost(location, aname);

    if (res is Propertypost) {
      loadingpropertypost.value = false;
      propertypostmodel = res;

      for (var e in propertypostmodel.data!.data!) {
        if (e.isLiked == 1) {
          lst1.add(e.id);
        }
      }
      print('******$lst1');
      return res;
    } else {
      errorloadingpropertypost.value = res.toString();
      loadingpropertypost.value = false;
    }
    update();
  }
}
