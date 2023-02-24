import 'package:get/get.dart';
import 'package:prologic_29/data/Models/like_model.dart';
import 'package:prologic_29/data/Services/post_like_services/post_like_services.dart';

class PostLikeController extends GetxController {
  RxBool loadingPostLike = false.obs;
  RxInt likeCount = 0.obs;
  var likeModel = LikeModel();
  RxString errorLoadingPostLike = ''.obs;

  RxList likeIdsList = [].obs;

  void removeLikeIds(propertyId) {
    likeIdsList.remove(propertyId);
  }

  getPostLike(propertyId, uid) async {
    loadingPostLike.value = true;
    errorLoadingPostLike.value = '';
    var res = await PostLikeServices.getPostLikeServicee(propertyId, uid);
    if (res is LikeModel) {
      print("api model++++++${res.isliked}");
      loadingPostLike.value = false;
      likeModel = res;
      print("api model++++++ ${likeModel.isliked}");
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

  @override
  void onInit() {}

  RxInt myindex = 0.obs;
  void myIndex(index) {
    myindex.value = index;
    print("controller  index===${myindex.value}");
  }
}
