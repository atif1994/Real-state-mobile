import 'package:get/get.dart';
import 'package:prologic_29/data/Models/NewsFeed_Model/newsfeed_model.dart';
import 'package:prologic_29/data/Models/like_model.dart';
import 'package:prologic_29/data/Services/post_like_services/post_like_services.dart';

class PostLikeController extends GetxController {
  RxBool loadingPostLike = false.obs;
  var likeModel = LikeModel();
  var newsfeedModel = NewsfeedModel();
  RxString errorLoadingPostLike = ''.obs;

  getPostLikeCon(propertyId, uid) async {
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
}
