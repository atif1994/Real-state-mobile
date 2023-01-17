import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/myproperty_model.dart';
import 'package:prologic_29/data/Models/propertyfilter_model.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/property_model/cities_response.dart';
import '../../Models/property_model/featured_propertise_response.dart';

class DashboardController extends GetxController {
  RxBool loadingFeaturedPropertise = false.obs;
  var featuredPropertyModel = FeaturedPropertiseModel();
  // List<Datum>? data;
  RxString errorLoadingFeaturedPropertise = ''.obs;
  int userid = 273;
  @override
  void onInit() {
    getFeaturedPropertise();
    getPrpertyCitis();
    // getFilteredPropertiseWithoutPerm();
    super.onInit();
    getuserId(userid);
    getMyProperty(userid);
    print("=============???????? $userid");
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
  void getFilteredPropertiseWithoutPerm(int cityId, int catId) async {
    var res =
        await FeaturedPropertyService.propertyfilterService(cityId, catId);

    loadingfilteredPropertise.value = false;

    if (res is PropertyFilterModel) {
      filteredPropertyModel = res;
    } else {
      loadingfilteredPropertise.value = false;

      errorLoadingFilteredPropertise.value = res.toString();
    }
  }

  //My Property  Api Call

  getuserId(userid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid = pref.getInt("userid");
  }

  var myPropertyModel = MyProperty();
  RxBool loadingMyPropertise = false.obs;
  RxString errorLoadingMyPropertise = ''.obs;
  void getMyProperty(int userid) async {
    var res = await FeaturedPropertyService.myPropertyService(userid);

    loadingMyPropertise.value = false;

    if (res is MyProperty) {
      myPropertyModel = res;
    } else {
      loadingMyPropertise.value = false;

      errorLoadingMyPropertise.value = res.toString();
    }
  }
}
