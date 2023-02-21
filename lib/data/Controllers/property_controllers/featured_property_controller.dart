import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/myproperty_model.dart';
import 'package:prologic_29/data/Models/property_filters_model/property_filters_response.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/newspost_model.dart';
import '../../Models/property_model/cities_response.dart';
import '../../Models/property_model/featured_propertise_response.dart';

class DashboardController extends GetxController {
  RxBool loadingFeaturedPropertise = false.obs;
  var featuredPropertyModel = FeaturedPropertiseModel();
  // List<Datum>? data;
  RxString errorLoadingFeaturedPropertise = ''.obs;
  int userid = 11;
  int? cid;
  String? cityName;
  int catid = 0;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() async {
    getCityInfo();
    getMyProperty(userid);
    await Future.delayed(const Duration(milliseconds: 400));
    getFilteredPropertise(cid, catid);
    getFeaturedPropertise();
    getPrpertyCitis();
    getnewspost();
  }

  void getFeaturedPropertise() async {
    loadingFeaturedPropertise.value = true;
    errorLoadingFeaturedPropertise.value = '';
    var res = await FeaturedPropertyService.getFeaturedPropertiser();
    if (res is FeaturedPropertiseModel) {
      featuredPropertyModel = res;
      loadingFeaturedPropertise.value = false;
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

  //filter property without perameter
  void getCityInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    cid = pref.getInt("cityId");
    cityName = pref.getString("cityName");
  }

  var filteredPropertyModel = PropertiseFiltersResponse();
  RxBool loadingfilteredPropertise = false.obs;
  RxString errorLoadingFilteredPropertise = ''.obs;
  void getFilteredPropertise(int? cid, catid) async {
    loadingfilteredPropertise.value = true;
    errorLoadingFilteredPropertise.value = '';
    var res =
        await FeaturedPropertyService.propertyfilterService(cid ?? 0, catid);
    loadingfilteredPropertise.value = false;
    if (res is PropertiseFiltersResponse) {
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
    var res = await FeaturedPropertyService.myPropertiser(userid);
    loadingMyPropertise.value = false;
    if (res is MyProperty) {
      myPropertyModel = res;
    } else {
      loadingMyPropertise.value = false;
      errorLoadingMyPropertise.value = res.toString();
    }
  }

  RxBool loadingnewspost = false.obs;
  var newspostModel = Newspost();
  RxString errorLoadingnewspost = ''.obs;
  void getnewspost() async {
    loadingnewspost.value = true;
    errorLoadingnewspost.value = '';
    var res = await FeaturedPropertyService.getNewsPostAPI();
    loadingnewspost.value = false;
    if (res is Newspost) {
      newspostModel = res;
    } else {
      loadingnewspost.value = false;
      errorLoadingnewspost.value = res.toString();
    }
  }
}
