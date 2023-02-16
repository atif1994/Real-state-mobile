import 'package:get/get.dart';
import 'package:prologic_29/data/Models/comments_models/get_comments.dart';
import 'package:prologic_29/data/Services/comments_services/get_comments_servic.dart';

class GetCommentsController extends GetxController {
  RxBool loadingComments = false.obs;
  RxString error = ''.obs;
  var commentsModel = GetCommentsResponse();

  void getComments(int pid) async {
    loadingComments.value = true;
    error.value = '';
    var res = await GetCommentService.assignAgents(pid);
    loadingComments.value = false;
    if (res is GetCommentsResponse) {
      commentsModel = res;
    } else {
      loadingComments.value = false;
      error.value = res.toString();
    }
  }
}
