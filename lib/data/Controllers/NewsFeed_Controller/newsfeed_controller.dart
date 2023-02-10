// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Services/NewsFeed_Services/newsfeed_services.dart';

class NewsFeedController extends GetxController {
  RxBool loadingnewspost = false.obs;
  var newsfeedmodel = NewsfeedModel();
  RxString errorLoadingnewsfeed = ''.obs;
  RxBool newsfeedApiLoading = false.obs;
  RxList idlst = [].obs;
  RxInt length = 0.obs;

  var scrollController = ScrollController();
  int pagekey = 1;
  @override
  void onInit() {
    newsfeedApiLoading.value = true;
  }

  getnewsfeed(pageKey) async {
    errorLoadingnewsfeed.value = '';
    loadingnewspost.value = true;
    var res = await NewsFeedService.getNewsFeedAPI();
    if (res is NewsfeedModel) {
      newsfeedApiLoading.value = false;
      loadingnewspost.value = false;
      newsfeedmodel = res;
    } else {
      loadingnewspost.value = false;
      errorLoadingnewsfeed.value = res.toString();
    }
    print("________News feed Api Call______");
    update();
  }
}
