import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Views/Agent/dashboard.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import '../../data/Controllers/auth_controller.dart';
import '../Home/home.dart';

class Auth extends GetView<AuthController> {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    if (controller.userId == null) {
      return const SignIn();
    } else if (controller.urole == 'customer') {
      return const Home();
    } else {
      return const AgentDashboard();
    }
    // if (controller.isSignedIn.value) {
    //   return const Home();
    // } else {
    //   if (controller.isSignInScreen.value) {
    //     return SignIn();
    //   } else {
    //     return SignUp();
    //   }
    // }
    // }
    // );
  }
}
