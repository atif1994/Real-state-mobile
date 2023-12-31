// ignore_for_file: must_call_super

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Services/NewsFeed_Services/newsfeed_services.dart';

import '../../../Views/Wishlist/favorites.dart';

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

  getnewsfeed() async {
    errorLoadingnewsfeed.value = '';
    loadingnewspost.value = true;
    var res = await NewsFeedService.getNewsFeedAPI();
    newsfeedApiLoading.value = false;
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

  // void getnewsfeedPagination(pageKey, limit) async {
  //   errorLoadingnewsfeed.value = '';
  //   loadingnewspost.value = true;
  //   var res = await NewsFeedService.getNewsFeedPagination(pageKey, limit);
  //   if (res is NewsfeedModel) {
  //     newsfeedApiLoading.value = false;
  //     loadingnewspost.value = false;
  //     newsfeedmodel = res;
  //   } else {
  //     loadingnewspost.value = false;
  //     errorLoadingnewsfeed.value = res.toString();
  //   }
  // }

  ////like loading

  // var likenewsfeedmodel = NewsfeedModel();
  // RxString likeerrorLoadingnewsfeed = ''.obs;
  // RxBool likeLoading = false.obs;

  // void getlikenewsfeedcomment() async {
  //   likeerrorLoadingnewsfeed.value = '';
  //   likeLoading.value = true;
  //   var res = await NewsFeedService.getNewsFeedAPI();
  //   if (res is NewsfeedModel) {
  //     likeLoading.value = false;
  //     likenewsfeedmodel = res;
  //   } else {
  //     loadingnewspost.value = false;
  //     likeLoading.value = false;
  //     likeerrorLoadingnewsfeed.value = res.toString();
  //   }
  // }
  // manage remove wishlist
}
