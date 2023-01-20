import 'package:get/state_manager.dart';
import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';
import 'package:prologic_29/data/Services/property_services/addproperty_services.dart';

class AddProperrtyController extends GetxController {
  @override
  void onInit() {
    print("add property???????????");
   // getAddProperty();

    super.onInit();
  }

  //Cities Api properties
  //Cities Api properties
  RxBool loadingAddProperty = false.obs;
  var addPropertyModel = AddPropertyModel();
  RxString errorLoadingAddProperty = ''.obs;

  void getAddProperty(name,disp) async {
    var res = await AddPropertyServices.addPropertyAPI(name, disp);
    if (res is AddPropertyModel) {
      addPropertyModel = res;
    } else {
      errorLoadingAddProperty.value = res.toString();
    }
  }
}
