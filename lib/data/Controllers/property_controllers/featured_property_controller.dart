import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/location_model.dart';
import 'package:prologic_29/data/Models/property_model/cities__model.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';

import '../../Models/property_model/featured_propertise_response.dart';

class DashboardController extends GetxController {
  RxBool loadingFeaturedPropertise = false.obs;
  var featuredPropertyModel = FeaturedPropertiseModel();
  // List<Datum>? data;
  RxString errorLoadingFeaturedPropertise = ''.obs;

  @override
  void onInit() {
    getFeaturedPropertise();
    getPrpertyCitis();
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

//Location Api properties
  RxBool loadingLocation = false.obs;
  var propertyLocationModel = LocationModel();
  RxString errorLoadingLocation = ''.obs;

  void getPrpertLocation(int id, int cnameId) async {
    loadingLocation.value = true;
    errorLoadingLocation.value = '';
    var res = await FeaturedPropertyService.getCityLocation(id, cnameId);
    loadingLocation.value = false;
    if (res is LocationModel) {
      propertyLocationModel = res;
    } else {
      loadingLocation.value = false;
      errorLoadingLocation.value = res.toString();
    }
  }
}
