import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

<<<<<<< HEAD
=======
import '../../Models/property_filters_model/property_filters_response.dart';
import '../../Models/property_model/cities_response.dart';
>>>>>>> 5cd189d14db24facf0eebdd5fb94a94b0317b883
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
<<<<<<< HEAD
=======

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

//---------Location Api Calls------

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

  //filter property without perameter
  // static Future<dynamic> getFilteredPropertywithoutperm() async {
  //   var url = "${AppUrls.baseUrl}${AppUrls.filteredPropertise}";

  //   try {
  //     var res = await BaseClientClass.post(url, {});

  //     if (res is http.Response) {
  //       return propertiseFiltersResponseFromJson(res.body);
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

  // static Future<dynamic> getCityLocation(int id, int cnameId) async {
  //   var url = "${AppUrls.baseUrl}${AppUrls.citiesLocation}/$id/$cnameId";
  //   var res = await BaseClientClass.get(url, '');

  //   try {
  //     if (res is http.Response) {
  //       return locationModelFromJson(res.body);
  //     } else {
  //       return res;
  //     }
  //   } catch (e) {
  //     return e;
  //   }
  // }

>>>>>>> 5cd189d14db24facf0eebdd5fb94a94b0317b883
}
