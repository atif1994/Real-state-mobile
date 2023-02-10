import 'dart:io';

import 'package:get/get.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/image_update_model.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/image_update_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateImageController extends GetxController {
  RxBool loadingupdateimage = false.obs;
  RxString errorloadingupdateimage = ''.obs;
  int? uid;

  var updateImageData = UpdateimageResponse();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getuserid();
  }

  void getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getInt("userid");
  }

  void updateprofileimage(File? img) async {
    loadingupdateimage = true.obs;
    errorloadingupdateimage = ''.obs;

    var res = await UpdateImageService.updateImage(img!, uid!);

    if (res is UpdateimageResponse) {
      loadingupdateimage = false.obs;
      updateImageData = res;
    } else {
      loadingupdateimage = false.obs;
      errorloadingupdateimage.value = res;
    }
  }
}
