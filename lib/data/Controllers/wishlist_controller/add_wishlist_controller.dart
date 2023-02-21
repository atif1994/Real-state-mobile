import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prologic_29/data/Services/wishlist_service/add_wishlist.dart';
import 'package:prologic_29/data/Services/wishlist_service/get_wishlist_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/wishlist_model/add_wishist_model.dart';
import '../../Models/wishlist_model/get_wishlist_model.dart';

class AddWishlistController extends GetxController {
  RxBool getloadwishlist = false.obs;

  RxBool loadingwishlist = false.obs;
  RxString errorLoadingwishlist = ''.obs;

  RxBool loadinggetwishlist = false.obs;
  RxString errorLoadinggetwishlist = ''.obs;

  int propId = 0;
  var wishlistModel = AddWishlistModel();
  var getwishlistmodel = GetWishlistModel();
  RxList pid = [].obs;
  int? uid;

  @override
  void onInit() async {
    getloadwishlist.value = true;
    getUserId();
    await Future.delayed(const Duration(seconds: 1));

    getwishlist();
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

  void getwishlist() async {
    errorLoadinggetwishlist.value = '';
    loadinggetwishlist.value = true;
    var res = await GetWishlistService.getWishlist(uid!);
    getloadwishlist.value = false;

    if (res is GetWishlistModel) {
      getloadwishlist.value = false;
      loadinggetwishlist.value = false;
      getwishlistmodel = res;
    } else {
      getloadwishlist.value = false;
      errorLoadinggetwishlist.value = res.toString();
      loadinggetwishlist.value = false;
    }
  }
}
