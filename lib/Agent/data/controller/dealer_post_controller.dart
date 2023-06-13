import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/models/dealer_post_model.dart';
import 'package:prologic_29/Agent/data/services/dealer_post_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Services/constants.dart';

class DealerPostController extends GetxController {
  RxBool loadingAddingPost = false.obs;
  RxString errorAddingPost = ''.obs;
  var locController = TextEditingController();
  var titleController = TextEditingController();

  var descController = TextEditingController();
  var tagController = TextEditingController();
  RxList tags = [].obs;
  Rx<File?> imageFile = Rx<File?>(null);

  int? uid;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserId();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  var dealerPostModel = DealerResponse();

  void addDealerPost(String title, String desc, String loc, File file) async {
    loadingAddingPost.value = true;
    errorAddingPost.value = '';

    var res = await DealerPostService.addDealerPost(
        uid!, title, desc, loc, tags, file);
    loadingAddingPost.value = false;
    if (res is DealerResponse) {
      dealerPostModel = res;
      locController.clear();
      titleController.clear();
      descController.clear();
      tags.clear();
      imageFile.value = null;
      apptoastshow(res.message);
    } else {
      loadingAddingPost.value = false;
      errorAddingPost.value = res;
    }
  }
}
