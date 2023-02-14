import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Services/propertybycity_services/property_by_city_service.dart';

import '../Models/propertyby_city_model.dart';

class PropertyByCityController extends GetxController {
  RxBool loadingPropertyByCity = false.obs;
  var propertybyCityModel = PropertyByCityModel();
  RxString errorLoadingPropertyByCity = ''.obs;

  void getPropertyByCity(int cityId) async {
    loadingPropertyByCity.value = true;
    errorLoadingPropertyByCity.value = '';
    var res = await PropertyByCityService.getPropertyByCityService(cityId);
    loadingPropertyByCity.value = false;
    if (res is PropertyByCityModel) {
      loadingPropertyByCity.value = false;
      propertybyCityModel = res;
    } else {
      loadingPropertyByCity.value = false;
      errorLoadingPropertyByCity.value = res.toString();
    }
  }
}
