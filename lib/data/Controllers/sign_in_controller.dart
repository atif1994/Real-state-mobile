import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:prologic_29/data/Models/signin_model.dart';
import 'package:prologic_29/data/Models/user_model.dart';
import 'package:prologic_29/utils/constants/session_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Views/Home/home.dart';
import '../Services/my_shared_preferences.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  int? userId;
  RxBool isHidden = true.obs;
  @override
  void onInit() {
    alreadyCheckLogin();
    // TODO: implement onInit
    super.onInit();
  }

  void alreadyCheckLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId = pref.getInt("userid");
    if (userId != null) {
      Get.to(const Home());
      //  Get.to(() => const MainScreen());
    } else {
      Get.to(SignIn());
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
//Save user and pass Controller
  void saveCredientials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("email", emailController.text);
    pref.setString("pass", passwordController.text);
  }

  RxBool isLoading = false.obs;
  LoginModel loginModel = LoginModel();
  String? imgUrl;

  signIn() async {
    isLoading.value = true;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://realestate.tecrux.solutions/api/v1/login'));
    request.body = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    if (response.statusCode < 201) {
      isLoading.value = false;
      print("rrr======$res-------");
      loginModel = loginModelFromJson(res);
      print("model --------${loginModel.data!.id}----");

      //save Crediential
      saveCredientials();

      //Data Store in Shared Pref...
      MySharedPreferences.storeUserData(
          userModel: UserModel(
        userId: loginModel.data!.id!,
        userName: loginModel.data!.username!,
        firstname: loginModel.data!.firstName!,
        lastname: loginModel.data!.lastName!,
        email: loginModel.data!.email!,
      ));

      int? userid = loginModel.data!.id;
      setUserid(userid!);

      _saveCountryData(
          loginModel.data!.city!.id!,
          loginModel.data!.city!.name!,
          loginModel.data!.firstName!,
          loginModel.data!.lastName!,
          loginModel.data!.email!,
          loginModel.data!.phone!,
          loginModel.data!.avatar!.url.toString());

      SessionController().userId = loginModel.data!.id!.toString();

      print(" User id ******************${SessionController().userId}");
      print(
          "image for login responsej==========${loginModel.data!.avatar!.url}");
      Get.find<AuthController>().isUserSignedIn();
      Get.snackbar('Signed In', 'User is signed in');
      Fluttertoast.showToast(msg: 'Authorised');
      isLoading.value = false;
      Get.to(const Home());
    } else {
      isLoading.value = false;
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: 'Unauthorised');
    }

/////

    // Map dataa = {
    //   'email': "shahbaz.ahmed@tecrux.com",
    //   // emailController.text.trim(),
    //   'password': "test1234",
    //   //passwordController.text.trim(),
    // };

    // isLoading = true.obs;
    // var res = await BaseClientClass.post(
    //     "https://realestate.tecrux.solutions/api/v1/login", dataa);

    // // dio.Response response = await dio.Dio().post(
    // //   'https://realestate.tecrux.net/api/v1/login',
    // //   data: {
    // //     'email': emailController.text.trim(),
    // //     'password': passwordController.text.trim(),
    // //   },s
    // // );

    // final data = res.body;
    // print("rrrrrr===$res");
    // isLoading = false.obs;
    // if (res["success"] == true) {
    //   final user = res['data'];
    //   MySharedPreferences.storeUserData(
    //       userModel: UserModel(
    //     userId: user['id'],
    //     // phone: user['phone'],
    //     userName: user['username'],
    //     firstname: user['first_name'],
    //     lastname: user['last_name'],
    //     email: user['email'],
    //   ));

    //   var userid = res['data']['id'];
    //   setUserid(userid);

    //   var cId = res['data']['city']['id'];
    //   var cName = res['data']['city']['name'];

    //   Get.find<AuthController>().isUserSignedIn();
    //   _saveCountryData(cId, cName, user['first_name'], user['last_name'],
    //       user['email'], user['phone']);

    //   Get.to(const HomeScreen());
    // } else {
    //   Fluttertoast.showToast(msg: 'Unauthorised');
    //   isLoading(false);

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

void setUserid(int userid) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setInt("userid", userid);
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

// import 'package:dio/dio.dart' as dio;
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:prologic_29/data/Services/my_shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Models/user_model.dart';
// import 'auth_controller.dart';

// class SignInController extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   RxBool isLoading = false.obs;

//   signIn() async {
//     isLoading(true);

//     dio.Response response = await dio.Dio().post(
//       'https://realestate.tecrux.net/api/v1/login',
//       data: {
//         'email': emailController.text.trim(),
//         'password': passwordController.text.trim(),
//       },
//     );

//     final data = response.data;

//     if (data['success']) {
//       final user = data['data'];
//       MySharedPreferences.storeUserData(
//           userModel: UserModel(
//         userId: user['id'],
//         // phone: user['phone'],
//         userName: user['username'],
//         firstname: user['first_name'],
//         lastname: user['last_name'],
//         email: user['email'],
//         // city: user['city'],
//         // country: user['country'],
//         // state: user['state'],
//       ));
//       var userid = data['data']['id'];
//       getuserId(userid);
//       var cId = data['data']['city']['id'];
//       var cName = data['data']['city']['name'];

//       Get.find<AuthController>().isUserSignedIn();
//       _saveCountryData(cId, cName);
//       // Get.snackbar('Signed In', 'User is signed in');
//       isLoading(false);
//     } else {
//       Fluttertoast.showToast(msg: 'Unauthorised');
//       isLoading(false);

//       // if (data['error'] == false) {
//       //   final user = data['data'];
//       //   MySharedPreferences.storeUserData(
//       //       userModel: UserModel(
//       //     userId: user['id'],
//       //     email: user['email'],
//       //     firstname: user['firstname'],
//       //     lastname: user['lastname'],

//       //   ));

//       //   Get.find<AuthController>().isUserSignedIn();

//       //   Get.snackbar('Signed In', 'User is signed in');
//       //   Fluttertoast.showToast(msg: 'Authorised');

//       //   isLoading(false);
//       // } else {
//       //   Fluttertoast.showToast(msg: 'unAuthorized');
//       //   isLoading(false);
//     }
//   }

//   getuserId(int userid) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setInt("userid", userid);
//   }

//   _saveCountryData(int cID, String cName) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();

//     pref.setInt("cityId", cID);
//     pref.setString("cityName", cName);
//   }
// }
