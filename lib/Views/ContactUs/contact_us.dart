// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:prologic_29/utils/styles/custom_decorations.dart';
import 'package:sizer/sizer.dart';

import '../../data/Controllers/contactus_controller/contact_us_controller.dart';
import '../../data/Services/constants.dart';
import '../../utils/constants/appcolors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var contactuscontroller = Get.put(ContactusController());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final subjectController = TextEditingController();
  final MessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appthem,
        centerTitle: true,
        title: Text("Contact Us", style: AppTextStyles.heading1),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 6.0.h,
                ),
                CustomTextField(
                  editingController: nameController,
                  hintText: 'Name',
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomTextField(
                  editingController: emailController,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomTextField(
                  editingController: phoneNumberController,
                  hintText: 'Phone No',
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomTextField(
                  editingController: subjectController,
                  hintText: 'Subject',
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomTextField(
                  editingController: MessageController,
                  hintText: 'Message',
                ),
                SizedBox(
                  height: 5.0.h,
                ),
                Column(
                  children: <Widget>[
                    Obx(
                      () => contactuscontroller.loadingcontactus.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.appthem,
                              ),
                            )
                          : contactuscontroller.errorloadingcontactus.value !=
                                  ''
                              ? Text(contactuscontroller
                                  .errorloadingcontactus.value)
                              : CustomButton(
                                  text: 'Send Message',
                                  onPressed: () {
                                    contactuscontroller.getcontactus(
                                        nameController.text,
                                        emailController.text,
                                        subjectController.text,
                                        phoneNumberController.text,
                                        MessageController.text);

                                    nameController.clear();
                                    emailController.clear();
                                    subjectController.clear();
                                    phoneNumberController.clear();
                                    MessageController.clear();
                                  },
                                ),
                    ),
                    // SizedBox(
                    //   height: 2.0.h,
                    // ),
                    // CustomButton(
                    //   text: 'Google Map',
                    //   onPressed: () {
                    //     //  makePostRequest();
                    //   },
                    // ),
                    SizedBox(
                      height: 2.0.h,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 30.0.h,
                        width: 100.0.w,
                        decoration: CustomDecorations.mainCon,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Center(
                              child: Text(
                                'Get In Touch with Us',
                                style: AppTextStyles.heading1.copyWith(
                                  color: AppColors.colorblack,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          myDivider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_city,
                                ),
                                SizedBox(
                                  width: 5.0.w,
                                ),
                                const Text('Bahria Town Phase 7')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.email),
                                SizedBox(
                                  width: 5.0.w,
                                ),
                                const Text('Abc@gmail.com')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.phone),
                                SizedBox(
                                  width: 5.0.w,
                                ),
                                const Text('051-5678982')
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
