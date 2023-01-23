import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Models/post_comments_model/post_comments_response.dart';
import 'package:prologic_29/data/Services/comment_services/post_comment_service.dart';

class PostCommentsController extends GetxController {
  RxBool loadingpostComments = false.obs;
  var postCommentModel = PostCommentsResponse();

  RxString errorLoadingPostComments = ''.obs;

  int userId = 0;

  postComments(int index, id, uid, String comm) async {
    loadingpostComments.value = true;
    errorLoadingPostComments.value = '';
    var res = await PostCommentServices.postComments(id.toString(), uid, comm);
    loadingpostComments.value = false;
    if (res is PostCommentsResponse) {
      postCommentModel = res;
      if (kDebugMode) {
        print(res);
      }
    } else {
      loadingpostComments.value = false;
      errorLoadingPostComments.value = res.toString();
    }
  }
}
