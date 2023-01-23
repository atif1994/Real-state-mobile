import 'package:get/get.dart';
import 'package:prologic_29/data/Services/post_like_services/post_like_services.dart';

import '../../Models/post_like_response/post_like_response.dart';

class PostLikeController extends GetxController {
  RxBool loadingPostLike = false.obs;
  var postLikeModel = PostLikeResponse();

  RxString errorLoadingPostLike = ''.obs;
  int propertyIndex = 0;
  RxBool isLikedPressed = false.obs;

  getPostLikeCon(int index, id, uid) async {
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

class CallMethod {
  final List<Function> _methods = [];
}
