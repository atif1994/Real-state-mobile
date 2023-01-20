import 'package:get/get.dart';

import '../../Models/post_like_response/post_like_response.dart';
import '../../Services/post_like_services/post_like_services.dart';

class PostLikeController extends GetxController {
  RxBool loadingPostLike = false.obs;
  var postLikeModel = PostLikeResponse();
  RxString errorLoadingPostLike = ''.obs;

  RxBool isLikedPressed = false.obs;

  void getPostLikeCon(id, uid) async {
    loadingPostLike.value = true;
    errorLoadingPostLike.value = '';
    var res = await PostLikeServices.getPostLikeServicee(id.toString(), uid);
    loadingPostLike.value = false;
    if (res is PostLikeResponse) {
      postLikeModel = res;
      print(res);
    } else {
      loadingPostLike.value = false;
      errorLoadingPostLike.value = res.toString();
    }
  }
}
