import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import '../../Models/property_model/property_by_id_model.dart';
import '../../Services/property_services/property_by_id_services.dart';

class PropertyDetailController extends GetxController {
  RxBool loadingPropertyByID = false.obs;
  var propertybyIDmodel = PropertyById();
  RxString errorLoadingPropertyByID = ''.obs;
  // int iWantTo = 0;
  // List<Images> images = [];
  List<XFile>? imageFileList = [];

  final titleController = TextEditingController();
  final dispController = TextEditingController();
  final contentController = TextEditingController();
  // final typeController = TextEditingController();
  final locatController = TextEditingController();
  // final cityController = TextEditingController();
  final sectorController = TextEditingController();
  final plotNoController = TextEditingController();
  final streetNoController = TextEditingController();
  final priceController = TextEditingController();
  final squareController = TextEditingController();
  final currController = TextEditingController();
  final distanceController = TextEditingController();
  final stateController = TextEditingController();
  final imgpath = TextEditingController();
  String dropdownvalue = 'PKR';
  int selectedBedroom = 0;
  int selectedBathroom = 0;
  int selectedFloor = 0;

  void getPropertydetail(int pid) async {
    print(pid);
    loadingPropertyByID.value = true;
    errorLoadingPropertyByID.value = '';
    var res = await PropertyByIDService.getPropertyById(pid);
    loadingPropertyByID.value = false;
    if (res is PropertyById) {
      propertybyIDmodel = res;
      titleController.text = res.data!.name.toString();
      dispController.text = res.data!.description.toString();
      locatController.text = res.data!.location.toString();
      sectorController.text = res.data!.sectorAndBlockName.toString();
      plotNoController.text = res.data!.plotNumber.toString();
      streetNoController.text = res.data!.streetNumber.toString();
      priceController.text = res.data!.price.toString();
      squareController.text = res.data!.square.toString();
      dropdownvalue = res.data!.currency!.title.toString();

      if (int.parse(res.data!.numberBedroom!) > 10) {
        selectedBedroom = 11;
      } else {
        selectedBedroom = int.parse(res.data!.numberBedroom.toString());
      }

      if (int.parse(res.data!.numberBathroom!) > 5) {
        selectedBedroom = 6;
      } else {
        selectedBathroom = int.parse(res.data!.numberBathroom.toString());
      }

      if (int.parse(res.data!.numberFloor!) > 5) {
        selectedFloor = 6;
      } else {
        selectedFloor = int.parse(res.data!.numberFloor.toString());
      }
    } else {
      loadingPropertyByID.value = false;
      errorLoadingPropertyByID.value = res.toString();
    }
  }
}
