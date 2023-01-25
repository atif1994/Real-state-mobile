import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';
import 'package:prologic_29/data/Models/addproperty_model/postDataProperty_model.dart';
import 'package:prologic_29/utils/constants/app_urls.dart';
import 'package:prologic_29/utils/constants/base_client.dart';
import 'package:http/http.dart' as http;

class AddPropertyServices {
  static Future<dynamic> addPropertyAPI({
    String? name,
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
    List? facilities,
  }) async {
    print("$name == $disp, ==$content");
    Map data = {
      "error": false,
      "data": {
        "assigner_id": 11,
        "name": name,
        "description": disp,
        "content": name,
        "sector_and_block_name": "block ei",
        "street_number": "56",
        "plot_number": "206",
        "location": location,
        "city_id": cityId,
        "state_id": 2,
        "price": "785494875",
        "currency_id": 1,
        "square": "46",
        "number_floor": "2",
        "number_bathroom": 3,
        "number_bedroom": bedroomNo,
        "category_id": categoryId,
        "type_id": 1,
        "expire_date": "2023-03-10T07:36:55.000000Z",
        "author_id": 11,
        "author_type": "Botble\\RealEstate\\Models\\Account",
        "updated_at": "2023-01-24T07:36:55.000000Z",
        "created_at": "2023-01-24T07:36:55.000000Z",
        "id": 167,
        "assigned_agent": null,
        "author": {
          "id": 11,
          "first_name": "Raja",
          "last_name": "Shaiui0hbaz",
          "username": "RajaShabi",
          "description": "jkfdjkldsjflka",
          "gender": "male",
          "email": "rshabi5100@gmail.com",
          "avatar_id": "8",
          "dob": "1999-05-16T19:00:00.000000Z",
          "phone": "894735897",
          "credits": "10",
          "confirmed_at": "2022-08-16T05:26:01.000000Z",
          "email_verify_token": null,
          "is_featured": "0",
          "created_at": "2022-08-16T08:26:01.000000Z",
          "updated_at": "2022-12-19T11:54:12.000000Z",
          "profile_image": null,
          "address_id": "1",
          "role_id": "4",
          "deleted_at": null,
          "active_status": "1"
        }
      },
      "message": "Created successfully"
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
