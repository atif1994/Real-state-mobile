import 'package:get/get.dart';
import 'package:prologic_29/data/Services/comment_services/get_latest_comments_servic.dart';

import '../../Models/comments/get_latest_comments_response.dart';

class GetLatestCommnets extends GetxController {
  RxBool loadingCommnets = false.obs;
  RxString error = "".obs;

  var commnetsModel = GetCommentsModel();

  void getLatestCommnets(int pid) async {
    loadingCommnets.value = true;
    error.value = "";
    var res = await GetCommentServices.getComments(pid);
    loadingCommnets.value = false;
    if (res is GetCommentsModel) {
      commnetsModel = res;
    } else {
      loadingCommnets.value = false;
      error.value = res.toString();
    }
  }
}
