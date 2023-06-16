import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/addproperty_model/getfacilities_model.dart';

class AddPropertyServices {
  static Future<dynamic> addPropertyAPI(
      {String? name,
      String? disp,
      String? content,
      String? block,
      String? streetNo,
      String? plotNo,
      String? location,
      String? cityId,
      String? stateId,
      String? price,
      String? currency,
      String? square,
      String? numberFloor,
      int? bathNo,
      int? bedroomNo,
      int? categoryId,
      int? typeId,
      List<dynamic>? feature,
      List? facilities,
      List? imageList,
      List? addedFacilityList}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int? userId = pref.getInt('userid');
    print("Image list in to APIIIIIIII--------$imageList");

    print("add facilityes Sercessssssssss $feature");

    Map data = {
      "plateform": "mobile",
      "assigner_id": userId,
      "name": name,
      "description": disp,
      "content": content,
      "sector_and_block_name": block,
      "street_number": streetNo,
      "plot_number": plotNo,
      "location": location,
      "city_id": cityId,
      "state_id": 2,
      "price": price,
      "currency_id": 1,
      "square": square,
      "number_floor": numberFloor,
      "number_bathroom": bedroomNo,
      "number_bedroom": bedroomNo,
      "category_id": categoryId,
      "type_id": typeId,
      "images": imageList,
      "features": feature,
      "facilities": addedFacilityList
    };
    var url = "${AppUrls.baseUrl}${AppUrls.addProperty}";

    try {
      var res = await BaseClientClass.post(url, data);
      if (res is http.Response) {
        return addPropertyModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }

  static Future<dynamic> getfacilities() async {
    var url = "${AppUrls.baseUrl}${AppUrls.facilities}";

    try {
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        return getFacilitiesResponseFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      return e;
    }
  }
}
//////



///