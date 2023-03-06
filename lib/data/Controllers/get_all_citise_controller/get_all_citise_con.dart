// ignore_for_file: must_call_super

import 'package:get/get.dart';
import 'package:prologic_29/data/Models/get_all_citiese/get_all_citise_response.dart';
import 'package:prologic_29/data/Services/get_all_citise_services/get_all_citise_service.dart';

class GetAllCitiseController extends GetxController {
  RxString errorLoadingAllCitise = ''.obs;
  RxBool allCitiseLoading = false.obs;

  var allCitise = GetAllCitiseResponse();

  @override
  getAllCitise() async {
    errorLoadingAllCitise.value = '';
    allCitiseLoading.value = true;
    var res = await GetAllCitiseServices.getAllCitise();
    allCitiseLoading.value = false;

    if (res is GetAllCitiseResponse) {
      allCitise = res;
    } else {
      allCitiseLoading.value = false;
      errorLoadingAllCitise.value = res.toString();
    }
  }
}
