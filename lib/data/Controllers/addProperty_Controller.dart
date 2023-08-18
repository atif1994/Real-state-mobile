import 'package:get/get.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/data/Models/addproperty_model/addproperty_model.dart';
import 'package:prologic_29/data/Services/property_services/addproperty_services.dart';

import '../../Views/AddProperty/add_property.dart';
import '../Models/addproperty_model/category_model.dart';
import '../Models/addproperty_model/getfacilities_model.dart';
import '../Models/addproperty_model/propertytype_model.dart';
import '../Models/propertyfeature_model.dart';

class AddProperrtyController extends GetxController {
  @override
  void onInit() {
    print("add property???????????");
    // getAddProperty();
    super.onInit();
    loadingGetFacilities.value = true;
    getFacilities();
    propertytypes();
    getFeatures();
    propertycategories();
  }

  List<ListFacility> listfac = [];

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
        cityId: cityId.toString(),
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
      apptoastshow(res.message);
    } else {
      loadingAddProperty.value = false;
      errorLoadingAddProperty.value = res.toString();
    }
  }

  //city List
  RxInt selectedValueCityId = 0.obs;
  RxString selectedValueCity = 'Select City'.obs;
  List dropdownValues = [];

  void selectCityFun(newValue) {
    selectedValueCityId.value = newValue;
  }
// Features List

//---------Facilities

  RxBool loadingGetFacilities = false.obs;
  var getFacilitiesModel = GetFacilitiesResponse();
  RxString errorLoadingGetFacilities = ''.obs;
  RxString dropdownvalue22 = '1'.obs;

  void getFacilities() async {
    errorLoadingGetFacilities.value = "";
    loadingGetFacilities.value = true;
    //  dynamic response = getFacilitiesModel.data!['data'];
    var res = await AddPropertyServices.getfacilities();
    if (res is GetFacilitiesResponse) {
      getFacilitiesModel = res;
      dropdownvalue22.value = res.data![0].id.toString();
      loadingGetFacilities.value = false;
    } else {
      loadingGetFacilities.value = false;
      errorLoadingGetFacilities.value = res.toString();
    }
  }

  //---------features

  var getFeaturesModel = GetFeaturesResponse();

  RxList sindex = [].obs;
  void getFeatures() async {
    errorLoadingGetFacilities.value = "";
    loadingGetFacilities.value = true;
    var res = await AddPropertyServices.getfeatures();
    if (res is GetFeaturesResponse) {
      getFeaturesModel = res;
      loadingGetFacilities.value = false;
    } else {
      loadingGetFacilities.value = false;
      errorLoadingGetFacilities.value = res.toString();
    }
  }

  //---------Property Types

  RxBool loadingPropertytypes = false.obs;
  var propertytypesModel = PropertyTypesResponse();
  RxString errorLoadingPropertytypes = ''.obs;

  void propertytypes() async {
    errorLoadingPropertytypes.value = "";
    loadingPropertytypes.value = true;
    //  dynamic response = PropertytypesModel.data!['data'];
    var res = await AddPropertyServices.propertytypes();
    if (res is PropertyTypesResponse) {
      propertytypesModel = res;
      loadingPropertytypes.value = false;
    } else {
      loadingPropertytypes.value = false;
      errorLoadingPropertytypes.value = res.toString();
    }
  }

  //---------Property Category

  RxBool loadingPropertyCategory = false.obs;
  var propertycategoriesModel = CategoryResponse();
  RxString errorLoadingPropertyCategory = ''.obs;
  RxInt selectedPropertyCategory = 0.obs;

  void propertycategories() async {
    errorLoadingPropertyCategory.value = "";
    loadingPropertyCategory.value = true;
    //  dynamic response = PropertytypesModel.data!['data'];
    var res = await AddPropertyServices.propertycategories();
    if (res is CategoryResponse) {
      propertycategoriesModel = res;
      selectedPropertyCategory.value = res.data![0].id!;
      homedata(res);
      plotdata(res);
      commercialdata(res);
      loadingPropertyCategory.value = false;
    } else {
      loadingPropertyCategory.value = false;
      errorLoadingPropertyCategory.value = res.toString();
    }
  }

  List<Home> homelist = [];
  homedata(res) {
    for (var cat in res.data!) {
      if (cat.parentclass == "0") {
        Home home = Home(id: cat.id, name: cat.name);
        homelist.add(home);
      }
    }
  }

  List<Plot> plotlist = [];
  plotdata(res) {
    for (var cat in res.data!) {
      if (cat.parentclass == "1") {
        Plot plot = Plot(id: cat.id, name: cat.name);
        plotlist.add(plot);
      }
    }
  }

  List<Commercial> commerciallist = [];
  commercialdata(res) {
    for (var cat in res.data!) {
      if (cat.parentclass == "2") {
        Commercial commercial = Commercial(id: cat.id, name: cat.name);
        commerciallist.add(commercial);
      }
    }
  }
  //city List
}

class Home {
  int? id;
  String? name;
  Home({this.id, this.name});
}

class Plot {
  int? id;
  String? name;
  Plot({this.id, this.name});
}

class Commercial {
  int? id;
  String? name;
  Commercial({this.id, this.name});
}
