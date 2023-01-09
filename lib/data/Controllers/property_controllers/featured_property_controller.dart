import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';

import '../../Models/property_model/featured_propertise_response.dart';

class FeaturedPropertyController extends GetxController {
  RxBool loadingFeaturedPropertise = false.obs;
  var featuredPropertyModel = FeaturedPropertiseModel();
  List<Datum>? data;
  RxString errorLoadingFeaturedPropertise = ''.obs;

  @override
  void onInit() {
    getFeaturedPropertise();
    super.onInit();
  }

  void getFeaturedPropertise() async {
    loadingFeaturedPropertise.value = true;
    errorLoadingFeaturedPropertise.value = '';
    var res = await FeaturedPropertyService.getFeaturedPropertiser();
    loadingFeaturedPropertise.value = false;
    if (res is FeaturedPropertiseModel) {
      featuredPropertyModel = res;
    } else {
      loadingFeaturedPropertise.value = false;
      errorLoadingFeaturedPropertise.value = res.toString();
    }
  }
}
