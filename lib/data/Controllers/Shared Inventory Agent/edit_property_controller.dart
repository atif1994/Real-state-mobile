import 'package:get/get.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';

import '../../Services/Agent Shared InventoryService/edit_property_service.dart';

class EditProperrtyController extends GetxController {
  RxBool loadingEditProperty = false.obs;
  RxString errorLoadingEditProperty = ''.obs;
  var addPropertyModel = AddPropertyModel();

  void getAddProperty(
      pid,
      name,
      assignerid,
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
      networkimageList,
      fileimagelist,
      addedFacilityList,
      status) async {
    errorLoadingEditProperty.value = "";
    loadingEditProperty.value = true;
    var res = await EditPropertyServices.addPropertyAPI(
        pid: pid,
        name: name,
        assignerid: assignerid,
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
        networkimglst: networkimageList,
        fileimglst: fileimagelist,
        addedFacilityList: addedFacilityList,
        status: status);
    if (res is AddPropertyModel) {
      addPropertyModel = res;
      loadingEditProperty.value = false;
    } else {
      loadingEditProperty.value = false;
      errorLoadingEditProperty.value = res.toString();
    }
    apptoastshow(addPropertyModel.message);
  }

  RxBool loadingEditSaveProperty = false.obs;
  RxString errorLoadingEditSaveProperty = ''.obs;
  void getAddSaveProperty(
      pid,
      name,
      assignerid,
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
      networkimageList,
      fileimagelist,
      addedFacilityList,
      status) async {
    errorLoadingEditProperty.value = "";
    loadingEditSaveProperty.value = true;
    var res = await EditPropertyServices.addPropertyAPI(
        pid: pid,
        name: name,
        assignerid: assignerid,
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
        networkimglst: networkimageList,
        fileimglst: fileimagelist,
        addedFacilityList: addedFacilityList,
        status: status);
    if (res is AddPropertyModel) {
      addPropertyModel = res;
      loadingEditSaveProperty.value = false;
    } else {
      loadingEditSaveProperty.value = false;
      errorLoadingEditSaveProperty.value = res.toString();
    }
    apptoastshow(addPropertyModel.message.toString());
    print("Message: ${addPropertyModel.message.toString()}");
  }
}
