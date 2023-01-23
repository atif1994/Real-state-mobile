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

  void getAddProperty(
    name,
    disp,
    content,
    block,
    streetNo,
    plotNo,
    location,
    cityId,
    stateId,
    price,
    currency,
    square,
    numberFloor,
    bathNo,
    bedroomNo,
    categoryId,
    typeId,
    feature,
    facilities,
  ) async {
    var res = await AddPropertyServices.addPropertyAPI(
        name: name,
        disp: disp,
        content: content,
        block: block,
        streetNo: streetNo,
        plotNo: plotNo,
        location: location,
        cityId: cityId,
        stateId: stateId,
        price: price,
        currency: currency,
        square: square,
        numberFloor: numberFloor,
        bathNo: bathNo,
        bedroomNo: bedroomNo,
        categoryId: categoryId,
        typeId: typeId,
        feature: feature,
        facilities: facilities);
    if (res is AddPropertyModel) {
      addPropertyModel = res;
    } else {
      errorLoadingAddProperty.value = res.to();
    }
  }
}
