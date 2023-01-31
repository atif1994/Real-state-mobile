import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Models/like_model.dart';
import 'package:prologic_29/data/Services/post_like_services/post_like_services.dart';

class PostLikeController extends GetxController {
  RxBool loadingPostLike = false.obs;
  var likeModel = LikeModel();
  var newsfeedModel = NewsfeedModel();
  RxString errorLoadingPostLike = ''.obs;

  getPostLike(propertyId, uid) async {
    loadingPostLike.value = false;
    errorLoadingPostLike.value = '';
    var res = await PostLikeServices.getPostLikeServicee(propertyId, uid);
    loadingPostLike.value = true;
    if (res is LikeModel) {
      loadingPostLike.value = false;
      likeModel = res;
    } else {
      loadingPostLike.value = false;
      errorLoadingPostLike.value = res.toString();
    }
  }

  RxBool isLike = false.obs;
  void isliked() {
    isLike.toggle();
    print(isLike);
  }

//like
  RxBool loadingnewspost = false.obs;
  var newsfeedmodel = NewsfeedModel();
  RxString errorLoadingnewsfeed = ''.obs;

  @override
  void onInit() {
    // getnewsfeedcomment();
  }

  // void getnewsfeedcomment() async {
  //   errorLoadingnewsfeed.value = '';
  //   var res = await NewsFeedService.getNewsFeedAPI();
  //   if (res is NewsfeedModel) {
  //     newsfeedmodel = res;
  //   } else {
  //     errorLoadingnewsfeed.value = res.toString();
  //   }
  // }
}
