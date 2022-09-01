import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_button.dart';
import 'package:prologic_29/My%20Widgets/my_text_field.dart';
import 'package:prologic_29/Views/Auth/sign_up.dart';
import 'package:prologic_29/Views/Home/home.dart';

import '../../Services/constants.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
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
                              MyTextField(
                                label: 'Email',
                                controller: _emailController,
                              ),
                              MyTextField(
                                label: 'Password',
                                controller: _passwordController,
                                isPasswordField: true,
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(color: Colors.red),
                                      ))),
                              MyButton(onTap: () {
                                Get.to(const Home());
                              }, text: 'SIGN IN'),
                              // const Padding(
                              //   padding: EdgeInsets.symmetric(vertical: 10),
                              //   child: Text('or Sign in with', style: TextStyle(color: Colors.white)),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text('Or Sign In With',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    const Expanded(
                                        child: Divider(
                                            color: Colors.grey,
                                            thickness: 1.5)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Image.asset(facebookIcon,
                                          width: 50, height: 50),
                                    ),
                                    Image.asset(googleIcon,
                                        width: 50, height: 50),
                                  ],
                                ),
                              ),
                              const Divider(color: Colors.grey, thickness: 1.5),
                              TextButton(
                                  onPressed: () {
                                    Get.off(SignUp());
                                  },
                                  child: const Text(
                                    'Don\'t have and account?\nCreate account',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
