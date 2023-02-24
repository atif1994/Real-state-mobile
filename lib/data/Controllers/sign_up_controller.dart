import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:prologic_29/data/Services/signup_services/signup_services.dart';
import '../Models/signup_model/signup_model.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
        phoneNumberController.text);
    if (res is SignupModel) {
      isLoading(false);
      // Fluttertoast.showToast(msg: "");
      Get.snackbar('Succfully Create Account', "");
      Get.to(SignIn());
      return res;
    } else {
      isLoading(false);
      errSignup.value = res;
      return res;
    }

//https://test.ditllcae.com/backend/public/api/
    // dio.Response response = await dio.Dio().post(
    //   'https://realestate.tecrux.net/api/v1/register',
    //   data: {
    //     'email': emailController.text.trim(),
    //     'password': passwordController.text.trim(),
    //     'username': UserController.text.trim(),
    //     'first_name': firstNameController.text.trim(),
    //     'last_name': lastNameController.text.trim(),
    //     'country': CountryController.text.trim(),
    //     'state': SateController.text.trim(),
    //     'city': CityController.text.trim(),
    //     'phone': phoneNumberController.text.trim(),
    //     'role_id': 4,
    //   },
    // );

    // final data = response.data;

    // if (data['error'] == false) {
    //   Fluttertoast.showToast(msg: 'Authorised');
    //   isLoading(false);
    //   final user = data['data'];
    //   MySharedPreferences.storeUserData(
    //       userModel: UserModel(
    //     userId: user['id'],
    //     // phone: user['phone'],
    //     userName: user['username'],
    //     firstname: user['first_name'],
    //     lastname: user['last_name'],
    //     email: user['email'],
    //     // city: user['city'],
    //     // country: user['country'],
    //     // state: user['state'],
    //   ));
    //   Get.find<AuthController>().isUserSignedIn();

    //   Get.snackbar('Signed In', 'User is signed in');
    // }

    // // print(data['data']);

    // else {
    //   Fluttertoast.showToast(msg: ':UnAuthorised');
    //   isLoading(false);
    //   print("error");
    // }
  }
}
