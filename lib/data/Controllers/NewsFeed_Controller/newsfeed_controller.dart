// ignore_for_file: must_call_super

import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Services/NewsFeed_Services/newsfeed_services.dart';

class NewsFeedController extends GetxController {
  RxBool loadingnewspost = false.obs;
  var newsfeedmodel = NewsfeedModel();
  RxString errorLoadingnewsfeed = ''.obs;

  @override
  void onInit() {}

  void getnewsfeedcomment() async {
    loadingnewspost.value = true;
    errorLoadingnewsfeed.value = '';
    var res = await NewsFeedService.getNewsFeedAPI();

    loadingnewspost.value = false;
    if (res is NewsfeedModel) {
      newsfeedmodel = res;
    } else {
      loadingnewspost.value = false;
      errorLoadingnewsfeed.value = res.toString();
    }
  }
}
