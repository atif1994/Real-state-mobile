import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Services/my_shared_preferences.dart';
import '../Models/user_model.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  signIn() async {
    isLoading(true);

    dio.Response response = await dio.Dio().post(
      'https://realestate.tecrux.net/api/v1/login',
      data: {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      },
    );

    final data = response.data;

    if (data['success']) {
      final user = data['data'];
      MySharedPreferences.storeUserData(
          userModel: UserModel(
        userId: user['id'],
        // phone: user['phone'],
        userName: user['username'],
        firstname: user['first_name'],
        lastname: user['last_name'],
        email: user['email'],
        // city: user['city'],
        // country: user['country'],
        // state: user['state'],

      ));

      Get.find<AuthController>().isUserSignedIn();

      // Get.snackbar('Signed In', 'User is signed in');
      isLoading(false);
    } else {
      Fluttertoast.showToast(msg: 'Unauthorised');
      isLoading(false);

    // if (data['error'] == false) {
    //   final user = data['data'];
    //   MySharedPreferences.storeUserData(
    //       userModel: UserModel(
    //     userId: user['id'],
    //     email: user['email'],
    //     firstname: user['firstname'],
    //     lastname: user['lastname'],
        

    //   ));

    //   Get.find<AuthController>().isUserSignedIn();

    //   Get.snackbar('Signed In', 'User is signed in');
    //   Fluttertoast.showToast(msg: 'Authorised');

    //   isLoading(false);
    // } else {
    //   Fluttertoast.showToast(msg: 'unAuthorized');
    //   isLoading(false);
    }
  }
}
