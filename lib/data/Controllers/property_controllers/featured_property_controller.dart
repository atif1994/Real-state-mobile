import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/propertyfilter_model.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';

import '../../Models/property_model/cities_response.dart';
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
    print("Filter propertties ================>>>>>>>>>>>>>>========");
    getFilteredPropertiseWithoutPerm();
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

// ///////////////////method for getting filtered propertise
//   RxBool loadingfilteredPropertise = false.obs;
//   RxString errorLoadingFilteredPropertise = ''.obs;
//   String type = 'popular';
//   var filteredPropertiseModel = PropertiseFiltersResponse();
//   void getFilteredPropertise(int cityId, int catId, String type) async {
//     loadingfilteredPropertise.value = true;
//     errorLoadingFilteredPropertise.value = '';

//     var res = await FeaturedPropertyService.getFilteredPropertise(
//         cityId, catId, type);

//     loadingfilteredPropertise.value = false;

//     if (res is PropertiseFiltersResponse) {
//       filteredPropertiseModel = res;
//     } else {
//       loadingfilteredPropertise.value = false;

//       errorLoadingFilteredPropertise.value = res.toString();
//     }
//   }

  //filter property without perameter
  var filteredPropertyModel = PropertyFilterModel();
  RxBool loadingfilteredPropertise = false.obs;
  RxString errorLoadingFilteredPropertise = ''.obs;
  void getFilteredPropertiseWithoutPerm() async {
    var res = await FeaturedPropertyService.propertyfilterService();

    loadingfilteredPropertise.value = false;

    if (res is PropertyFilterModel) {
      filteredPropertyModel = res;
    } else {
      loadingfilteredPropertise.value = false;

      errorLoadingFilteredPropertise.value = res.toString();
    }
  }
}
