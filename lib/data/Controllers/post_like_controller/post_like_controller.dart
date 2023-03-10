import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prologic_29/data/Models/like_model.dart';
import 'package:prologic_29/data/Services/post_like_services/post_like_services.dart';

class PostLikeController extends GetxController {
  List likelist = [];
  int? hiveuId;
  final box = Hive.box("likelist");
  gethiveList() async {
    List likeList = [1, 2, 3, 4];
    await box.put("likeList", likeList);
    var likelist = box.get("likeList");
    print("hive listtt  $likelist");
  }

  RxInt? userid;
  @override
  void onInit() async {
    hiveuId = await box.get("uid");
    getPostLike(285, hiveuId);
    gethiveList();
  }

  var propertyid;
  RxBool loadingPostLike = false.obs;
  RxInt likeCount = 0.obs;
  var likeModel = LikeModel();
  RxString errorLoadingPostLike = ''.obs;

  RxList likeIdsList2 = [].obs;

  getPostLike(propertyId, uid) async {
    print("like api state callllllll $propertyId  $uid");
    loadingPostLike.value = true;
    errorLoadingPostLike.value = '';
    var res =
        await PostLikeServices.getPostLikeServicee(propertyId.toString(), uid);
    if (res is LikeModel) {
      loadingPostLike.value = false;
      likeModel = res;
      final likeIdsList = likeModel.likelist as List<Likelist>;
      likeIdsList2.value = [];
      for (var e in likeIdsList) {
        likeIdsList2.add(int.parse(e.propertyId.toString()));
      }

      await box.add(likeIdsList2);

      print("Like List++API++++ $likeIdsList2");
    } else {
      loadingPostLike.value = false;
      errorLoadingPostLike.value = res.toString();
    }
  }
}
