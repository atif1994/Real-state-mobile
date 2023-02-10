import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prologic_29/data/Services/wishlist_service.dart';

import '../Models/wishlist_model.dart';

class wishlistController extends GetxController {
  RxBool wishloadApiLoad = false.obs;

  @override
  void onInit() async {
    wishloadApiLoad.value = true;
    super.onInit();
    getids();
    await Future.delayed(Duration(seconds: 1));
    getwishlist();
  }

  RxBool loadingwishlist = false.obs;
  RxString errorloadingwishlist = ''.obs;
  List<dynamic> idlst = [];
  WishlistResponse wishlistResponse = WishlistResponse();

  getids() async {
    var box = await Hive.openBox('wishlist');
    idlst = box.get('idlist');
  }

  void getwishlist() async {
    loadingwishlist.value = true;

    var res = await getWishlistService.wishlistservice(idlst);
    wishloadApiLoad.value = false;
    if (res is WishlistResponse) {
      wishloadApiLoad.value = false;
      loadingwishlist.value = false;
      wishlistResponse = res;
    } else {
      wishloadApiLoad.value = false;
      loadingwishlist.value = false;
      errorloadingwishlist.value = res.toString();
    }
  }
}
