// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:csc_picker/csc_picker.dart';
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
  final _formkey = GlobalKey<FormState>();
  SignUp({Key? key}) : super(key: key);

  @override
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
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
                                      TextFormField(
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            hintText: 'User Name'),
                                        controller:
                                            controller.UserController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter user name';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            hintText: 'First Name'),
                                        controller:
                                            controller.firstNameController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            hintText: 'Last Name'),
                                        controller:
                                            controller.lastNameController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            hintText: 'Mobile No'),
                                        controller:
                                            controller.phoneNumberController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Mobile No';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        showCursor: true,
                                        decoration:
                                            InputDecoration(hintText: 'Email'),
                                        controller: controller.emailController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Email';
                                          }
                                          return null;
                                        },
                                      ),
                                      TextFormField(
                                        showCursor: true,
                                        decoration: InputDecoration(
                                            hintText: 'Password'),
                                        controller:
                                            controller.passwordController,
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your Password';
                                          }
                                          return null;
                                        },
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
                                      controller.SateController.text= value.toString();
                                      // setState(() {
                                      //   ///store value in state variable
                                      //   stateValue = value.toString();
                                      // });
                                    },

                                    ///triggers once city selected in dropdown
                                    onCityChanged: (value) {
                                      controller.CityController.text=value.toString();
                                      //controller=controller.CityController,
                                      // setState(() {
                                      //   ///store value in city variable
                                      //  // cityValue = value.toString();
                                      // });
                                    },
                                  ),
                                  MyButton(
                                      onTap: () {
                                        if (_formkey.currentState!.validate()) {
                                          controller.signUp();
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
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Text('Or Sign Up With',
                                              style: TextStyle(
                                                  color: Colors.white)),
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
                                  const Divider(
                                      color: Colors.grey, thickness: 1.5),
                                  TextButton(
                                      onPressed: () {
                                        Get.find<AuthController>()
                                            .isSignInScreen
                                            .value = true;
                                      },
                                      child: const Text(
                                        'Already have a CG Account?\nLog In',
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
