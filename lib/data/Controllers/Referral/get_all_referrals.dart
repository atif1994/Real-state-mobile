import 'package:get/get.dart';

import '../../Models/Referrals/get_all_referral.dart';
import '../../Services/Referals/get_all_referrals.dart';

class GetRefferal extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getrefferal();
  }

  RxBool getrefferalload = false.obs;
  RxString getrefferalerrormsg = ''.obs;
  Referral referral = Referral();

  getrefferal() async {
    getrefferalload.value = true;
    getrefferalerrormsg.value = '';
    var res = await GetAllReferral.getallreferral(62);
    if (res is Referral) {
      getrefferalload.value = false;
      referral = res;
    } else {
      getrefferalload.value = false;
      getrefferalerrormsg.value = res.toString();
    }
  }
}
