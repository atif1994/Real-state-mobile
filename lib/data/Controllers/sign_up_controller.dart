// ignore_for_file: avoid_print, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Home/home.dart';
import 'package:prologic_29/data/Services/signup_services/signup_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/get_all_citiese/get_all_citise_response.dart';
import '../Models/signup_model/signup_model.dart';
import '../Models/user_model.dart';
import '../Services/get_all_citise_services/get_all_citise_service.dart';
import '../Services/my_shared_preferences.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    print('signupcontroller');
    // TODO: implement onInit
    super.onInit();
    allCitiseLoading.value = true;
    getAllCitise();
  }

  final _formkey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController UserController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController CountryController = TextEditingController();
  final TextEditingController SateController = TextEditingController();
  RxBool isLoading = false.obs;
  var signupModel = SignupModel();
  RxString errSignup = ''.obs;
  RxBool isHidden = true.obs;

  // ignore_for_file: must_call_super

  RxString errorLoadingAllCitise = ''.obs;
  RxBool allCitiseLoading = false.obs;
  RxString dropdown = 'Rawalpindi'.obs;
  var allCitise = GetAllCitiseResponse();

  getAllCitise() async {
    errorLoadingAllCitise.value = '';
    allCitiseLoading.value = true;
    var res = await GetAllCitiseServices.getAllCitise();
    allCitiseLoading.value = false;

    if (res is GetAllCitiseResponse) {
      allCitiseLoading.value = false;
      dropdown.value = res.data![0].name!;
      print(dropdown);
      allCitise = res;
    } else {
      allCitiseLoading.value = false;
      errorLoadingAllCitise.value = res.toString();
    }
  }

  signUp() async {
    print(CountryController.text);
    print(SateController.text);
    print(UserController.text);
    isLoading.value = true;
    var res = await SignupServices.signupServices(
        emailController.text,
        passwordController.text,
        UserController.text,
        firstNameController.text,
        lastNameController.text,
        'Pakistan',
        SateController.text,
        dropdown.value,
        phoneNumberController.text,
        'customer');
    if (res is SignupModel) {
      isLoading(false);
      // Fluttertoast.showToast(msg: "");
      Get.snackbar(res.message.toString(), '',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);

      MySharedPreferences.storeUserData(
          userModel: UserModel(
        userId: res.data!.id!,
        userName: res.data!.username!,
        firstname: res.data!.firstName!,
        lastname: res.data!.lastName!,
        email: res.data!.email!,
      ));
      _saveCountryData(
          1,
          '',
          // res.data!.city!.id!,
          // res.data!.city!.name!,
          res.data!.firstName!,
          res.data!.lastName!,
          res.data!.email!,
          res.data!.phone ?? '098888',
          ''
          // res.data!.avatar!.url.toString()
          );

      Get.to(() => const Home());
      return res;
    } else {
      isLoading(false);
      // errSignup.value = res;
      Get.snackbar('Server Error',
          'We apologise and are fixing the problem, Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.blue);
      return res;
    }
  }

  _saveCountryData(int cID, String cName, String fname, String lname,
      String email, String phone, String imgurl) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setInt("cityId", cID);
    pref.setString("cityName", cName);
    pref.setString("fname", fname);
    pref.setString("lname", lname);
    pref.setString("email", email);
    pref.setString("phone", phone);
    pref.setString("imgurl", imgurl);

    print("image store in shared pref. from login==========$imgurl");
  }
}
