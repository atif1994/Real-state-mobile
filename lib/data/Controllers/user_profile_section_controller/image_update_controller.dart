import 'dart:io';

import 'package:get/get.dart';
import 'package:prologic_29/Views/user_profile/setting/settings_screen.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/image_update_model.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/image_update_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateImageController extends GetxController {
  RxBool loadingupdateimage = false.obs;
  RxString errorloadingupdateimage = ''.obs;
  int? uid;
  String imagePath = "";

  var updateImageModel = UpdateimageResponse();
 

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

  void updateprofileimage(File img) async {
    imagePath = img.path.toString();
    loadingupdateimage.value = true;
    errorloadingupdateimage = ''.obs;

    var res = await UpdateImageService().uploadFile(img, uid!);
    loadingupdateimage.value = false;
    if (res is UpdateimageResponse) {
      updateImageModel = res;
      _saveImage();
      loadingupdateimage.value = false;
      Get.to(() => const SettingsScreen());
    } else {
      loadingupdateimage.value = false;
      errorloadingupdateimage.value = res;
    }
  }

  _saveImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("img", updateImageModel.data!.avatar ?? "");
    print("upload image url-------${updateImageModel.data!.avatar}");
  }
}
