// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Auth/sign_up.dart';
import 'package:prologic_29/data/Controllers/forget_pass_controller.dart';
import 'package:prologic_29/data/Controllers/sign_in_controller.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import '../../data/Services/constants.dart';

class SignIn extends GetView<SignInController> {
  SignIn({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final signController = Get.put(SignInController());
  final forgetPassController = Get.put(ForgetPassController());

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
              Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
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
                                              return emailvalidator(value);
                                            },
                                          ),
                                          TextFormField(
                                            obscureText:
                                                controller.isHidden.value,
                                            showCursor: true,
                                            decoration: InputDecoration(
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    controller.isHidden.value =
                                                        !controller
                                                            .isHidden.value;
                                                  },
                                                  child: controller
                                                          .isHidden.value
                                                      ? const Icon(
                                                          Icons.visibility_off)
                                                      : const Icon(
                                                          Icons.visibility),
                                                ),
                                                hintText: 'password'),
                                            controller:
                                                controller.passwordController,
                                            // validator: (String? value) {
                                            //   return passwordvalidator(value);
                                            // },
                                          ),

                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print(
                                                          "Forget pass click");
                                                      forgetPassController
                                                          .getForgetPass(
                                                              signController
                                                                  .emailController
                                                                  .text);
                                                    },
                                                    child: const Text(
                                                      'Forgot Password?',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ))),
                                          MyButton(
                                              onTap: () {
                                                if (_formkey.currentState!
                                                    .validate()) {
                                                  print('............');
                                                  controller.signIn();

                                                  // print("Successfull");
                                                }
                                              },
                                              text: 'SIGN IN'),

                                          // const Padding(
                                          //   padding: EdgeInsets.symmetric(vertical: 10),
                                          //   child: Text('or Sign in with', style: TextStyle(color: Colors.white)),
                                          // ),
                                          // Padding(
                                          //   padding: const EdgeInsets.symmetric(
                                          //       vertical: 15),
                                          //   child: Row(
                                          //     mainAxisAlignment:
                                          //         MainAxisAlignment.center,
                                          //     children: [
                                          //       const Padding(
                                          //         padding: EdgeInsets.only(
                                          //             right: 10),
                                          //         child: Text('Or Sign In With',
                                          //             style: TextStyle(
                                          //                 color: Colors.white)),
                                          //       ),
                                          //       const Expanded(
                                          //           child: Divider(
                                          //               color: Colors.grey,
                                          //               thickness: 1.5)),
                                          //       Padding(
                                          //         padding: const EdgeInsets
                                          //                 .symmetric(
                                          //             horizontal: 10),
                                          //         child: Image.asset(
                                          //             facebookIcon,
                                          //             width: 50,
                                          //             height: 50),
                                          //       ),
                                          //       Image.asset(googleIcon,
                                          //           width: 50, height: 50),
                                          //     ],
                                          //   ),
                                          // ),

                                          const Divider(
                                              color: Colors.grey,
                                              thickness: 1.5),
                                          TextButton(
                                              onPressed: () {
                                                // Get.find<AuthController>()
                                                //     .isSignInScreen
                                                //     .value = false;
                                                signController.signIn();
                                              },
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(SignUp());
                                                },
                                                child: const Text(
                                                  'Don\'t have and account?\nCreate account',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ))))
            ],
          ),
        ),
      ),
    );
  }
}
