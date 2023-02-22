import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Services/wishlist_service/add_wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/wishlist_model/add_wishist_model.dart';

class AddWishlistController extends GetxController {
  RxBool loadingwishlist = false.obs;
  RxString errorLoadingwishlist = ''.obs;
  int propId = 0;
  var wishlistModel = AddWishlistModel();
  List<dynamic> pid = [];
  int? uid;

  @override
  void onInit() {
    getUserId();
    super.onInit();
  }

  void getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    uid = pref.getInt("userid");
    if (kDebugMode) {
      print("__________________________$uid");
    }
  }

  void postwishlist() async {
    errorLoadingwishlist.value = '';
    loadingwishlist.value = true;

    var res = await AddWishlistService.addwishlistAgents(uid!, pid);
    print('>>>>>>>>>$uid');
    loadingwishlist.value = false;
    if (res is AddWishlistModel) {
      wishlistModel = res;
    } else {
      errorLoadingwishlist.value = res.toString();
      loadingwishlist.value = false;
    }
  }
}
