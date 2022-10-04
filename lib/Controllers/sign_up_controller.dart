import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../Models/user_model.dart';
import '../Services/my_shared_preferences.dart';
import 'auth_controller.dart';

class SignUpController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController CountryController = TextEditingController();
  final TextEditingController SateController = TextEditingController();
  final TextEditingController CityController = TextEditingController();
  RxBool isLoading = false.obs;

  signUp() async {
    isLoading(true);
//https://test.ditllcae.com/backend/public/api/
    dio.Response response = await dio.Dio().post(
      'http://realestate.tecrux.net/api/signup',
      data: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
        'username': emailController.text.trim(),
        'fname': firstNameController.text,
        'lname': lastNameController.text,
        'country':CountryController.text,
        'state':SateController.text,
        'city':CityController.text,
        'role_id': 2,
      },
    );

    final data = response.data;

    if (data['success']) {
      final user = data['data'];
      MySharedPreferences.storeUserData(
          userModel: UserModel(
            userId: user['id'],
            firstName: user['name'],
            lastName: user['name'],
            email: user['email'],
          ));

      Get.find<AuthController>().isUserSignedIn();

      // Get.snackbar('Signed In', 'User is signed in');
      isLoading(false);
    }else{
      Fluttertoast.showToast(msg: 'Unauthorised');
      isLoading(false);
    }
  }
}