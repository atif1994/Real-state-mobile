import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Models/mypropertyModel.dart';

import '../../Models/newspost_model.dart';

import '../../Models/property_filters_model/property_filters_response.dart';
import '../../Models/property_model/cities_response.dart';
import '../../Models/property_model/featured_propertise_response.dart';

class FeaturedPropertyService {
  static Future<dynamic> getFeaturedPropertiser() async {
    var url = "${AppUrls.baseUrl}${AppUrls.featuredProperty}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return featuredPropertiseModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
  // static Future<dynamic> filterApiCall() async {
  //   var url = "${AppUrls.baseUrl} ${AppUrls.filteredPropertise}";
  //   var res = BaseClientClass.get(url, '');
  //   if (res is http.Response) {
  //     return propertiseFiltersResponseFromJson();
  //   } else {
  //     return res;
  //   }
  // }

//----Cities API Call----

  static Future<dynamic> getCities() async {
    var url = "${AppUrls.baseUrl}${AppUrls.propertyCities}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return citiesResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

//---------filter Api Calls------

  static Future<dynamic> getFilteredPropertise(
      int cityId, int catId, String type) async {
    Map data = {"city_id": cityId, "category_id": catId, "type": type};

    var url = "${AppUrls.baseUrl}${AppUrls.filteredPropertise}";

    try {
      var res = await BaseClientClass.post(url, data);

      if (res is http.Response) {
        return propertiseFiltersResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

//---------property filter------------

  static Future<dynamic> propertyfilterService(int cid, int catid) async {
    Map data = {
      "city_id": cid,
      "category_id": catid,
    };
    var url = "${AppUrls.baseUrl}${AppUrls.filteredPropertise}";

    try {
      var res = await BaseClientClass.post(url, data);
      if (res is http.Response) {
        return propertiseFiltersResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //---------property My prperty------------

  static Future<dynamic> myPropertiser(int id) async {
    var url = "${AppUrls.baseUrl}${AppUrls.myProperty}$id";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return myPropertyResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
  // static Future<dynamic> myPropertyService(int userid) async {
  //   var url = "${AppUrls.baseUrl}${AppUrls.myproerty} $userid";

  //   try {
  //     var res = await BaseClientClass.get(url, '');
  //     if (res is http.Response) {
  //       return myPropertyFromJson(res.body);
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  static Future<dynamic> getNewsPostAPI() async {
    var url = "${AppUrls.baseUrl}${AppUrls.dealerPost}";
    var res = await BaseClientClass.get(url, '');

    try {
      if (res is http.Response) {
        return newspostFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  //static getNewsfeedAPI() {}
}
