import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:prologic_29/Views/user_profile/setting/settings_screen.dart';
import 'package:prologic_29/data/Models/user_profile_section_model/image_update_model.dart';
import 'package:prologic_29/data/Services/user_profile_section_services/image_update_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Models/signin_model.dart';

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
    getCredientials();
  }

  void getuserid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    uid = prefs.getInt("userid");
  }

//Get Credientials
  String? email;
  String? pass;

  void getCredientials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString("email");
    pass = pref.getString("pass");

    print("user name pass  $email  $pass");
  }

  void updateprofileimage(File img) async {
    imagePath = img.path.toString();
    loadingupdateimage.value = true;
    errorloadingupdateimage = ''.obs;

    var res = await UpdateImageService().uploadFile(img, uid!);
    loadingupdateimage.value = false;
    if (res is UpdateimageResponse) {
      updateImageModel = res;
      replaceImageFromLoginToNewUpdate();
      _saveImage();
      signIn();
      loadingupdateimage.value = false;
      Get.to(() => SettingsScreen());
    } else {
      errorloadingupdateimage.value = res;
      loadingupdateimage.value = false;
    }
  }

  _saveImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("img", updateImageModel.data!.avatar ?? "");
    print("upload image url-------${updateImageModel.data!.avatar}");
  }

  LoginModel loginModel = LoginModel();

  signIn() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://realestate.tecrux.solutions/api/v1/login'));
    request.body = json.encode({"email": email, "password": pass});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    if (response.statusCode < 201) {
      print("rrr======$res-------");
      loginModel = loginModelFromJson(res);
      replaceImageFromLoginToNewUpdate();
      print("model --------${loginModel.data!.id}----");
    }
  }

//image url replace from login avatar to new updated avatar
  void replaceImageFromLoginToNewUpdate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("imgurl", updateImageModel.data!.avatar.toString());
    String? newimgurl = pref.getString("imgurl");
    print("replce Image url Successfully $newimgurl");
  }
}
