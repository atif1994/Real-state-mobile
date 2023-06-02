import 'package:get/get.dart';
import 'package:prologic_29/data/Services/homefilter_service.dart';
import '../Models/propertyby_city_model.dart';

class FilterPropertiesController extends GetxController {
  @override
  RxBool loadingfilterpost = false.obs;
  RxString errorloadingfilterpost = ''.obs;
  PropertyByCityModel propertypostmodel = PropertyByCityModel();

  getfilterproperties(catid, cityid) async {
    loadingfilterpost.value = true;
    errorloadingfilterpost.value = '';

    var res = await HomefilterServices.filterProperties(catid, cityid);

    if (res is PropertyByCityModel) {
      loadingfilterpost.value = false;
      propertypostmodel = res;
      return res;
    } else {
      errorloadingfilterpost.value = res.toString();
      loadingfilterpost.value = false;
    }
  }
}
