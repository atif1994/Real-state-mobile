import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Controllers/sign_up_controller.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';

import '../../Controllers/auth_controller.dart';
import '../../My Widgets/my_button.dart';
import '../../My Widgets/my_text_field.dart';
import '../../Services/constants.dart';
import '../Home/home.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5)
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(() {
                if(!controller.isLoading.value){
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 25),
                                    child: Text('Sign Up',
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaleFactor: 1.5),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Create your account',
                                        style: TextStyle(color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaleFactor: 1.5),
                                  ),
                                  MyTextField(
                                    label: 'First Name',
                                    controller: controller.firstNameController,
                                  ),
                                  MyTextField(
                                    label: 'Last Name',
                                    controller: controller.lastNameController,
                                  ),
                                  MyTextField(
                                    label: 'Phone Number',
                                    controller: controller.phoneNumberController,
                                  ),
                                  MyTextField(
                                    label: 'Email',
                                    controller: controller.emailController,
                                  ),
                                  MyTextField(
                                    label: 'Password',
                                    controller: controller.passwordController,
                                    isPasswordField: true,
                                  ),
                                  MyButton(
                                      onTap: () {
                                        controller.signUp();
                                      }, text: 'SIGN UP'),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('Or Sign Up With',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                        const Expanded(child: Divider(
                                            color: Colors.grey, thickness: 1.5)),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Image.asset(
                                              facebookIcon, width: 50,
                                              height: 50),),
                                        Image.asset(
                                            googleIcon, width: 50, height: 50),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                      color: Colors.grey, thickness: 1.5),
                                  TextButton(onPressed: () {
                                    Get.find<AuthController>().isSignInScreen.value = true;
                                  },
                                      child: const Text(
                                        'Already have a CG Account?\nLog In',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }else{
                  return loader;
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
