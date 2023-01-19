import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/data/Services/Contact_us_services/contact_us_response_model.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';

import '../../Services/Contact_us_services/contact_us_services.dart';

class ContactusController extends GetxController {
  RxBool loadingcontactus = false.obs;
  RxString errorloadingcontactus = ''.obs;
  var contactusModel = ContactUsResponseModel();
  void getcontactus(String name, String email, String subject, String phone,
      String content) async {
    loadingcontactus.value = true;
    errorloadingcontactus.value = '';
    var res = await ContactUsServices.getContactUsServices(
        name, email, subject, phone, content);

    loadingcontactus.value = false;
    if (res is ContactUsResponseModel) {
      contactusModel = res;
      print(res);

      Get.snackbar("Successfully", contactusModel.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.appthem,
          colorText: Colors.white);
    } else {
      errorloadingcontactus.value = res;
    }
  }
}
