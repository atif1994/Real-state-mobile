import 'package:get/get.dart';
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
      price,
      square,
      numberFloor,
      bathNo,
      bedroomNo,
      categoryId,
      typeId,
      feature,
      facilities,
      imageList,
      addedFacilityList) async {
    errorLoadingAddProperty.value = "";
    loadingAddProperty.value = true;
    var res = await AddPropertyServices.addPropertyAPI(
        name: name,
        disp: disp,
        content: content,
        block: block,
        streetNo: streetNo,
        plotNo: plotNo,
        location: location,
        cityId: cityId,
        price: price,
        square: square,
        numberFloor: numberFloor,
        bathNo: bathNo,
        bedroomNo: bedroomNo,
        categoryId: categoryId,
        typeId: typeId,
        feature: feature,
        facilities: facilities,
        imageList: imageList,
        addedFacilityList: addedFacilityList);
    if (res is AddPropertyModel) {
      addPropertyModel = res;
      loadingAddProperty.value = false;
    } else {
      loadingAddProperty.value = false;
      errorLoadingAddProperty.value = res.toString();
    }
  }

  //city List
  RxInt selectedValueCityId = 0.obs;
  RxString selectedValueCity = 'Select City'.obs;
  void selectCityFun(newValue) {
    selectedValueCityId.value = newValue;
  }
// Features List
}
