// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_text_field.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Auth/forgotpass.dart';
import 'package:prologic_29/Views/Auth/sign_up.dart';
import 'package:prologic_29/data/Controllers/sign_in_controller.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import '../../data/Services/constants.dart';
import '../../utils/constants/appcolors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();

  final signController = Get.put(SignInController());

  var controller = Get.put(SignInController());

  List<String> items = ['--Select Role--', 'agent', 'customer'];

  String dropdownvalue = '--Select Role--';

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
                            color: AppColors.themelightcolor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    //...........
                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       setState(() {
                                    //         dropdownvalue = 'customer';
                                    //         controller.emailController.text =
                                    //             'zebi.biit@gmail.com';
                                    //         controller.passwordController.text =
                                    //             'test12345';
                                    //       });
                                    //     },
                                    //     child: const Text('Customer')),
                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       setState(() {
                                    //         dropdownvalue = 'agent';
                                    //         controller.emailController.text =
                                    //             'agent@gmail.com';
                                    //         controller.passwordController.text =
                                    //             'test1234';
                                    //       });
                                    //     },
                                    //     child: const Text('agent')),
                                    //..............
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
                                      child: Text('Welcome to RealEstate',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textScaleFactor: 1.5),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: AppColors.colorWhite,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton<String>(
                                              underline: Container(),
                                              isExpanded: true,
                                              value: dropdownvalue,
                                              onChanged: (String? val) {
                                                setState(() {
                                                  dropdownvalue =
                                                      val.toString();
                                                });
                                              },
                                              items: items.map<
                                                      DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList()),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Form(
                                      key: _formkey,
                                      child: Column(
                                        children: [
                                          NewTextField(
                                            validator: (String? value) {
                                              return emailvalidator(value);
                                            },
                                            controller:
                                                controller.emailController,
                                            label: 'Email',
                                            hintText: 'user@gmail.com',
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          NewTextField(
                                            controller:
                                                controller.passwordController,
                                            label: 'Password',
                                            hintText: '********',
                                            isPasswordField: true,
                                          ),

                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                  onPressed: () {},
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print(
                                                          "Forget pass click");
                                                      Get.to(() =>
                                                          const Forgotpass());
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
                                                  if (dropdownvalue ==
                                                      '--Select Role--') {
                                                    Fluttertoast.showToast(
                                                        msg: 'Select Role');
                                                  } else {
                                                    controller
                                                        .signIn(dropdownvalue);
                                                  }
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
                                                signController
                                                    .signIn(dropdownvalue);
                                              },
                                              child: GestureDetector(
                                                onTap: () {
                                                  Get.to(const SignUp());
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
