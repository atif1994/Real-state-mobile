import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';
import 'package:prologic_29/data/Models/addproperty_model/postDataProperty_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class AddPropertyServices {
  static Future<dynamic> addPropertyAPI(
{    String? name,
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
    List<Feature>? feature,
    List? facilities,}
  ) async {
    Map data = {
      "plateform": "mobile",
      "assigner_id": 11,
      "name": name,
      "description": disp,
      "content": content,
      "sector_and_block_name": block,
      "street_number": streetNo,
      "plot_number": plotNo,
      "location": location,
      "city_id": cityId,
      "state_id": stateId,
      "price": price,
      "currency_id": currency,
      "square": square,
      "number_floor": numberFloor,
      "number_bathroom": bathNo,
      "number_bedroom": bedroomNo,
      "category_id": categoryId,
      "type_id": typeId,
      "features": feature,
      //  [
      //   {"feature_id": "2"},
      //   {"feature_id": "3"}
      // ],
      "facilities": facilities
      //  [
      //   {"id": 1, "distance": 25},
      //   {"id": 2, "distance": 25}
      // ]
    };

    var url = "${AppUrls.baseUrl}${AppUrls.addProperty}";

    try {
      var res = await BaseClientClass.post(url, data);
      if (res is http.Response) {
        return addPropertyModelFromJson(res.body);
      }
    } catch (e) {
      return e;
    }
  }
}
