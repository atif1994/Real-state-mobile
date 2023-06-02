import 'package:get/get.dart';
import 'package:prologic_29/Agent/data/services/dealer_page_service.dart';

import '../models/dealer_page_model.dart';

class DealerPageController extends GetxController {
  RxBool loadingShowPost = false.obs;
  RxString errorShowPost = ''.obs;
  // int uid = 0;
  var dealerPageModel = Dealerpage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    showDealerPage();
  }

  void showDealerPage() async {
    loadingShowPost.value = true;
    errorShowPost.value = '';

    var res = await DealerPageService.showDealerPage(4);
    loadingShowPost.value = false;
    if (res is Dealerpage) {
      dealerPageModel = res;
    } else {
      loadingShowPost.value = false;
      errorShowPost.value = res.toString();
    }
  }
}
