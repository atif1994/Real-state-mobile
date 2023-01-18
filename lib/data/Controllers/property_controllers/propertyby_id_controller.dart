import 'package:get/state_manager.dart';
import '../../Models/property_model/property_by_id_model.dart';
import '../../Services/property_services/property_by_id_services.dart';

class PropertyByIDController extends GetxController {
  RxBool loadingPropertyByID = false.obs;
  var propertybyIDmodel = PropertyById();
  RxString errorLoadingPropertyByID = ''.obs;

  void getPropertyById(int pid) async {
    loadingPropertyByID.value = true;
    errorLoadingPropertyByID.value = '';
    var res = await PropertyByIDService.getPropertyById(pid);
    loadingPropertyByID.value = false;
    if (res is PropertyById) {
      propertybyIDmodel = res;
    } else {
      loadingPropertyByID.value = false;
      errorLoadingPropertyByID.value = res.toString();
    }
  }
}


// void getPrpertyByID() async {
//   loadingPropertyByID.value = true;
//   errorLoadingProperty.value = '';
//   var res = await FeaturedPropertyService.getPropertyById();
//   loadingPropertyByID.value = false;
//   if (res is PropertyById) {
//     popertyByIDModel = res;
//   } else {
//     loadingPropertyByID.value = false;
//     errorLoadingProperty.value = res.toString();
//   }
// }