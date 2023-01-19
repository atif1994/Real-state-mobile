import 'package:prologic_29/data/Models/addproperty_model.dart';
import 'package:prologic_29/data/Models/postDataProperty_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddPropertyServices {
  static Future<dynamic> addPropertyAPI() async {
    PostDataProperty postDataProperty = PostDataProperty();
    // print("=====postDAta=======>>>>${postDataProperty.name}");
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? title = pref.getString("title");
    print("=====title=======>>>>$title");
    print("=====title=======>>>>$title");
    Map data = {
      "plateform": "mobile",
      "assigner_id": 11,
      "name": "$title",
      "description": "description",
      "content": "testing from mobile",
      "sector_and_block_name": "block ei",
      "street_number": "56",
      "plot_number": "206",
      "location": "rawalpindi",
      "city_id": "2",
      "state_id": 2,
      "price": "785494875",
      "currency_id": 1,
      "square": "46",
      "number_floor": "2",
      "number_bathroom": 3,
      "number_bedroom": 8,
      "category_id": 4,
      "type_id": 1,
      "features": [
        {"feature_id": "2"},
        {"feature_id": "3"}
      ],
      "facilities": [
        {"id": 1, "distance": 25},
        {"id": 2, "distance": 25}
      ]
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
