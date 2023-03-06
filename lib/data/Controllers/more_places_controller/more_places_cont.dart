// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Services/NewsFeed_Services/newsfeed_services.dart';

import '../../../Views/Wishlist/favorites.dart';

class MorePlacesController extends GetxController {
  var newsfeedmodel = NewsfeedModel();
  RxString errorLoadingnewsfeed = ''.obs;
  RxBool newsfeedApiLoading = false.obs;

  RxList idlst = [].obs;
  RxInt maxlength = 6.obs;
  int page = 0;
  bool hasMore = false;

  var scrollController = ScrollController();
  int pagekey = 1;
  @override
  getnewsfeed() async {
    errorLoadingnewsfeed.value = '';
    newsfeedApiLoading.value = true;
    var res = await NewsFeedService.getNewsFeedAPI();
    newsfeedApiLoading.value = false;
    page = page + 1;
    hasMore = newsfeedmodel.data!.length < maxlength.value;
    if (res is NewsfeedModel) {
      newsfeedApiLoading.value = false;

      newsfeedmodel = res;
    } else {
      newsfeedApiLoading.value = false;
      errorLoadingnewsfeed.value = res.toString();
    }
    print("________News feed Api Call______");
    update();
  }
}
