import 'dart:convert';
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
=======

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
import 'package:prologic_29/data/Models/login_model.dart';
import 'package:prologic_29/data/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
import '../../Views/Home/home.dart';
import '../Services/my_shared_preferences.dart';
import 'auth_controller.dart';

class SignInController extends GetxController {
  int? userId;
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
      Get.to(Home());
    } else {
      Get.to(SignIn());
    }
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  LoginModel loginModel = LoginModel();
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  signIn() async {
    isLoading.value = true;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('https://realestate.tecrux.solutions/api/v1/login'));
    request.body = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    request.headers.addAll(headers);
<<<<<<< HEAD
    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    if (res is LoginModel) {
      print("rrr======$res-------");
      loginModel = loginModelFromJson(res);
      print("model --------${loginModel.data!.id}----");
=======

    http.StreamedResponse response = await request.send();
    var res = await response.stream.bytesToString();
    if (response.statusCode < 201) {
      print("rrr======$res-------");
      loginModel = loginModelFromJson(res);
      print("model --------${loginModel.data!.id}----");

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
      //Data Store in Shared Pref...
      MySharedPreferences.storeUserData(
          userModel: UserModel(
        userId: loginModel.data!.id!,
        userName: loginModel.data!.username!,
        firstname: loginModel.data!.firstName!,
        lastname: loginModel.data!.lastName!,
        email: loginModel.data!.email!,
      ));
<<<<<<< HEAD
      int? userid = loginModel.data!.id;
      setUserid(userid!);
=======

      int? userid = loginModel.data!.id;
      setUserid(userid!);

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
      _saveCountryData(
          loginModel.data!.city!.id!,
          loginModel.data!.city!.name!,
          loginModel.data!.firstName!,
          loginModel.data!.lastName!,
          loginModel.data!.email!,
<<<<<<< HEAD
          loginModel.data!.phone!);
=======
          loginModel.data!.phone!,
          loginModel.data!.avatar!.url ?? "");
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
      Get.find<AuthController>().isUserSignedIn();
      Get.snackbar('Signed In', 'User is signed in');
      Fluttertoast.showToast(msg: 'Authorised');
      isLoading.value = false;
<<<<<<< HEAD
      Get.to(() => const Home());
=======
      Get.to(Home());
      print("***************************${loginModel.data!.avatar!}");
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
    } else {
      isLoading.value = false;
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: 'Unauthorised');
    }
<<<<<<< HEAD
/////
=======

    //Go to Signup page

/////

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
    // Map dataa = {
    //   'email': "shahbaz.ahmed@tecrux.com",
    //   // emailController.text.trim(),
    //   'password': "test1234",
    //   //passwordController.text.trim(),
    // };
<<<<<<< HEAD
    // isLoading = true.obs;
    // var res = await BaseClientClass.post(
    //     "https://realestate.tecrux.solutions/api/v1/login", dataa);
=======

    // isLoading = true.obs;
    // var res = await BaseClientClass.post(
    //     "https://realestate.tecrux.solutions/api/v1/login", dataa);

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
    // // dio.Response response = await dio.Dio().post(
    // //   'https://realestate.tecrux.net/api/v1/login',
    // //   data: {
    // //     'email': emailController.text.trim(),
    // //     'password': passwordController.text.trim(),
    // //   },s
    // // );
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
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
<<<<<<< HEAD
    //   var userid = res['data']['id'];
    //   setUserid(userid);
    //   var cId = res['data']['city']['id'];
    //   var cName = res['data']['city']['name'];
    //   Get.find<AuthController>().isUserSignedIn();
    //   _saveCountryData(cId, cName, user['first_name'], user['last_name'],
    //       user['email'], user['phone']);
=======

    //   var userid = res['data']['id'];
    //   setUserid(userid);

    //   var cId = res['data']['city']['id'];
    //   var cName = res['data']['city']['name'];

    //   Get.find<AuthController>().isUserSignedIn();
    //   _saveCountryData(cId, cName, user['first_name'], user['last_name'],
    //       user['email'], user['phone']);

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
    //   Get.to(const HomeScreen());
    // } else {
    //   Fluttertoast.showToast(msg: 'Unauthorised');
    //   isLoading(false);
<<<<<<< HEAD
=======

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
    // if (data['error'] == false) {
    //   final user = data['data'];
    //   MySharedPreferences.storeUserData(
    //       userModel: UserModel(
    //     userId: user['id'],
    //     email: user['email'],
    //     firstname: user['firstname'],
    //     lastname: user['lastname'],
<<<<<<< HEAD
    //   ));
    //   Get.find<AuthController>().isUserSignedIn();
    //   Get.snackbar('Signed In', 'User is signed in');
    //   Fluttertoast.showToast(msg: 'Authorised');
=======

    //   ));

    //   Get.find<AuthController>().isUserSignedIn();

    //   Get.snackbar('Signed In', 'User is signed in');
    //   Fluttertoast.showToast(msg: 'Authorised');

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
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
<<<<<<< HEAD
    String email, String phone) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
=======
    String email, String phone, String img) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
  pref.setInt("cityId", cID);
  pref.setString("cityName", cName);
  pref.setString("fname", fname);
  pref.setString("lname", lname);
  pref.setString("email", email);
  pref.setString("phone", phone);
<<<<<<< HEAD
}
=======
  pref.setString("img", img);
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
>>>>>>> db9c9bf85ad7a7f81d9bde185344f65e23224438
