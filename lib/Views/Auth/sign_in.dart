import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Controllers/sign_in_controller.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';

import '../../Controllers/auth_controller.dart';
import '../../Services/constants.dart';

class SignIn extends GetView<SignInController> {
  SignIn({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Obx(() {
                if (!controller.isLoading.value) {
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
                                      child: Text('Sign In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5),
                                    ),
                                    const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Welcome to CG',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5),
                                    ),
                                    Form(
                                      key: _formkey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            showCursor: true,
                                            decoration: const InputDecoration(
                                                hintText: 'Email'),
                                            controller:
                                                controller.emailController,
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              return null;
                                            },
                                          ),
                                          TextFormField(
                                            showCursor: true,
                                            decoration: const InputDecoration(
                                                hintText: 'password'),
                                            controller:
                                                controller.passwordController,
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                          ),

                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ))),
                                          MyButton(
                                              onTap: () {
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  controller.signIn();
                                                  // print("Successfull");
                                                } else {
                                                  print("Unsuccessfull");
                                                }
                                              },
                                              text: 'SIGN IN'),
                                          // const Padding(
                                          //   padding: EdgeInsets.symmetric(vertical: 10),
                                          //   child: Text('or Sign in with', style: TextStyle(color: Colors.white)),
                                          // ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text('Or Sign In With',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                                const Expanded(
                                                    child: Divider(
                                                        color: Colors.grey,
                                                        thickness: 1.5)),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Image.asset(
                                                      facebookIcon,
                                                      width: 50,
                                                      height: 50),
                                                ),
                                                Image.asset(googleIcon,
                                                    width: 50, height: 50),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                              color: Colors.grey,
                                              thickness: 1.5),
                                          TextButton(
                                              onPressed: () {
                                                Get.find<AuthController>()
                                                    .isSignInScreen
                                                    .value = false;
                                              },
                                              child: const Text(
                                                'Don\'t have and account?\nCreate account',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      )));
                } else {
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
