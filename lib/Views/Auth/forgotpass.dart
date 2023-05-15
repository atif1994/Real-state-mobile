import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_text_field_2.dart';
import '../../My Widgets/my_button.dart';
import '../../data/Controllers/forget_pass_controller.dart';
import '../../utils/constants/appcolors.dart';

class Forgotpass extends StatelessWidget {
  const Forgotpass({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPassController = Get.put(ForgetPassController());
    final formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
          backgroundColor: AppColors.appthem,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image.asset('assets/forgotpass.jpg'),
                        MyTextField2(
                          label: 'E-mail Address *',
                          suffixIcon: const Icon(Icons.mail),
                          controller: emailcontroller,
                          // validator: emailValidator(emailcontroller.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: MyButton(
                              onTap: () {
                                if (emailcontroller.text.isNotEmpty) {
                                  forgetPassController
                                      .getForgetPass(emailcontroller.text);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Email field is not empty');
                                }
                              },
                              text: 'Reset'),
                        ),
                      ]),
                ))));
  }
}
