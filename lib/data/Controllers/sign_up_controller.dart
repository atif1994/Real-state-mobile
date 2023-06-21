// ignore_for_file: avoid_print, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/home.dart';
import 'package:prologic_29/data/Services/signup_services/signup_services.dart';
import '../Models/signup_model/signup_model.dart';

class SignUpController extends GetxController {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController UserController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController CountryController = TextEditingController();
  final TextEditingController SateController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  RxBool isLoading = false.obs;
  var signupModel = SignupModel();
  RxString errSignup = ''.obs;
  RxBool isHidden = true.obs;

  signUp() async {
    print(CountryController.text);
    print(CityController.text);
    print(SateController.text);
    print(UserController.text);
    isLoading.value = true;
    var res = await SignupServices.signupServices(
        emailController.text,
        passwordController.text,
        UserController.text,
        firstNameController.text,
        lastNameController.text,
        CountryController.text,
        SateController.text,
        CityController.text,
        phoneNumberController.text,
        'customer');
    if (res is SignupModel) {
      isLoading(false);
      // Fluttertoast.showToast(msg: "");
      Get.snackbar(
        'Successfully Create Account',
        "",
      );
      Get.to(() => const Home());
      return res;
    } else {
      isLoading(false);
      errSignup.value = res;
      return res;
    }
  }
}
