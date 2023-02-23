import 'package:get/state_manager.dart';
import '../../Models/property_model/property_by_id_model.dart';
import '../../Services/property_services/property_by_id_services.dart';

class PropertyByIDController extends GetxController {
  RxBool loadingPropertyByID = false.obs;
  var propertybyIDmodel = PropertyById();
  RxString errorLoadingPropertyByID = ''.obs;
  List<Images> images = [];

  void getPropertyById(int pid) async {
    print(pid);
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
