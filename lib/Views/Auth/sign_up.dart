// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member, must_be_immutable

import 'dart:ui';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prologic_29/My%20Widgets/my_text_field.dart';
import 'package:prologic_29/Services/constants.dart';
import 'package:prologic_29/Views/Auth/sign_in.dart';
import 'package:prologic_29/data/Controllers/sign_up_controller.dart';
import 'package:prologic_29/utils/constants/appcolors.dart';
import 'package:sizer/sizer.dart';
import '../../My Widgets/my_button.dart';
import '../../data/Services/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  @override
  String countryValue = "";

  String stateValue = "";

  String cityValue = "";

  String address = "";

  List<String> items = ['--Select Role--', 'agent', 'customer'];

  String dropdownvalue = '--Select Role--';

  var controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
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
                          height: 80.h,
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
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 25),
                                    child: Text('Sign Up',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaleFactor: 1.5),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Create your account',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textScaleFactor: 1.5),
                                  ),
                                  Form(
                                    key: _formkey,
                                    child: Column(children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter user name';
                                          }
                                          return null;
                                        },
                                        hintText: 'user@1',
                                        label: 'User Name',
                                        controller: controller.UserController,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        hintText: 'User',
                                        label: 'First Name',
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.firstNameController,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        hintText: 'User',
                                        label: 'Last Name',
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.lastNameController,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Mobile No';
                                          }
                                          return null;
                                        },
                                        controller:
                                            controller.phoneNumberController,
                                        hintText: '012345',
                                        label: 'Mobile No.',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        validator: (String? value) {
                                          return emailvalidator(value);
                                        },
                                        controller: controller.emailController,
                                        hintText: 'User@gmail.com',
                                        label: 'Email',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      NewTextField(
                                        isPasswordField: true,
                                        validator: (String? value) {
                                          return passwordvalidator(value);
                                        },
                                        controller:
                                            controller.passwordController,
                                        hintText: '*******',
                                        label: 'Password',
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CSCPicker(
                                    layout: Layout.vertical,
                                    dropdownDialogRadius: 30,
                                    searchBarRadius: 30,

                                    ///Enable disable state dropdown [OPTIONAL PARAMETER]
                                    showStates: true,

                                    /// Enable disable city drop down [OPTIONAL PARAMETER]
                                    showCities: true,

                                    ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                                    flagState: CountryFlag.DISABLE,

                                    ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                                    dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1)),

                                    ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                                    disabledDropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.grey.shade300,
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1)),

                                    ///placeholders for dropdown search field
                                    countrySearchPlaceholder: "Country",
                                    stateSearchPlaceholder: "State",
                                    citySearchPlaceholder: "City",

                                    ///labels for dropdown
                                    countryDropdownLabel: "*Country",
                                    stateDropdownLabel: "*State",
                                    cityDropdownLabel: "*City",

                                    ///Default Country
                                    //defaultCountry: DefaultCountry.India,

                                    ///Disable country dropdown (Note: use it with default country)
                                    //disableCountry: true,

                                    ///selected item style [OPTIONAL PARAMETER]
                                    // ignore: prefer_const_constructors
                                    selectedItemStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),

                                    ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                                    // ignore: prefer_const_constructors
                                    dropdownHeadingStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),

                                    ///DropdownDialog Item style [OPTIONAL PARAMETER]
                                    dropdownItemStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),

                                    ///Dialog box radius [OPTIONAL PARAMETER]
                                    // dropdownDialogRadius: 10.0,

                                    ///Search bar radius [OPTIONAL PARAMETER]
                                    // searchBarRadius: 10.0,

                                    ///triggers once country selected in dropdown
                                    onCountryChanged: (value) {
                                      controller.CountryController.text = value;

                                      // setState(() {
                                      //   ///store value in country variable
                                      //   countryValue = value;
                                      // });
                                    },

                                    ///triggers once state selected in dropdown
                                    onStateChanged: (value) {
                                      controller.SateController.text =
                                          value.toString();
                                      // setState(() {
                                      //   ///store value in state variable
                                      //   stateValue = value.toString();
                                      // });
                                    },

                                    ///triggers once city selected in dropdown
                                    onCityChanged: (value) {
                                      controller.CityController.text =
                                          value.toString();
                                      //controller=controller.CityController,
                                      // setState(() {
                                      //   ///store value in city variable
                                      //  // cityValue = value.toString();
                                      // });
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DecoratedBox(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.colorWhite),
                                          color: AppColors.themelightcolor,
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
                                                        DropdownMenuItem<
                                                            String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList()),
                                          ))),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  MyButton(
                                      onTap: () {
                                        if (_formkey.currentState!.validate()) {
                                          if (dropdownvalue ==
                                              '--Select Role--') {
                                            Fluttertoast.showToast(
                                                msg: 'Select Role');
                                          } else {
                                            controller.signUp(dropdownvalue);
                                          }
                                          // print("Successfull");
                                        } else {
                                          print("Unsuccessfull");
                                        }
                                      },
                                      text: 'SIGN UP'),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        // Padding(
                                        //   padding: EdgeInsets.only(right: 10),
                                        //   child: Text('Or Sign Up With',
                                        //       style: TextStyle(
                                        //           color: Colors.white)),
                                        // ),
                                        // const Expanded(
                                        //     child: Divider(
                                        //         color: Colors.grey,
                                        //         thickness: 1.5)),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       horizontal: 10),
                                        //   child: Image.asset(facebookIcon,
                                        //       width: 50, height: 50),
                                        // ),
                                        // Image.asset(googleIcon,
                                        //     width: 50, height: 50),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                      color: Colors.grey, thickness: 1.5),
                                  TextButton(
                                      onPressed: () {
                                        // Get.find<AuthController>()
                                        //     .isSignInScreen
                                        //     .value = true;
                                      },
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(SignIn());
                                        },
                                        child: const Text(
                                          'Already have an Account?\nLog In',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
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
