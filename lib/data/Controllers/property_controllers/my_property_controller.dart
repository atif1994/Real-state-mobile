import 'package:get/get.dart';
// import 'package:prologic_29/data/Models/property_model/mypropertyModel.dart';
import 'package:prologic_29/data/Services/property_services/featured_property_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/mypropertyModel.dart';

class MyPropertyController extends GetxController {
  RxBool loadingMyPropertise = false.obs;
  RxString errorGettingMyPropertise = ''.obs;

  var myPropertiseResponse = MyPropertyResponse();
  int? userId;

  @override
  void onInit() async {
    getUserId();
    await Future.delayed(const Duration(seconds: 2));
    getMyPropertise(userId);
    super.onInit();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    userId = pref.getInt('userid');

    print("*****************$userId");
  }

  void getMyPropertise(userId) async {
    loadingMyPropertise.value = true;
    errorGettingMyPropertise.value = '';

    var res = await FeaturedPropertyService.myPropertiser(userId);
    loadingMyPropertise.value = false;
    if (res is MyPropertyResponse) {
      myPropertiseResponse = res;
    } else {
      loadingMyPropertise.value = false;
      errorGettingMyPropertise.value = res.toString();
    }
  }
}
