import 'dart:io';

import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/models/dealer_post_model.dart';
import 'package:prologic_29/Agent/data/services/dealer_post_service.dart';

class DealerPostController extends GetxController {
  RxBool loadingAddingPost = false.obs;
  RxString errorAddingPost = ''.obs;
  RxList tags = [].obs;

  var dealerPostModel = DealerResponse();

  void addDealerPost(
      int uid, String desc, String loc, String tags, File file) async {
    loadingAddingPost.value = true;
    errorAddingPost.value = '';

    var res = await DealerPostService.addDealerPost(uid, desc, loc, tags, file);
    loadingAddingPost.value = false;
    if (res is DealerResponse) {
      dealerPostModel = res;
    } else {
      loadingAddingPost.value = false;
      errorAddingPost.value = res;
    }
  }
}
