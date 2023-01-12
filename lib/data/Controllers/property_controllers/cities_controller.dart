import 'package:get/state_manager.dart';

import '../../Models/property_model/cities_response.dart';
import '../../Services/property_services/featured_property_service.dart';

class CitiesController extends GetxController {
  @override
  void onInit() {
    getPrpertyCitis();
    super.onInit();
  }

  //Cities Api properties
  RxBool loadingCities = false.obs;
  var citiesModel = CitiesResponse();
  RxString errorLoadingCities = ''.obs;

  void getPrpertyCitis() async {
    loadingCities.value = true;
    errorLoadingCities.value = '';
    var res = await FeaturedPropertyService.getCities();
    loadingCities.value = false;
    if (res is CitiesResponse) {
      citiesModel = res;
    } else {
      loadingCities.value = false;
      errorLoadingCities.value = res.toString();
    }
  }
}
