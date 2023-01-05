import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:prologic_29/custom_widgets/custom_button.dart';
import 'package:prologic_29/custom_widgets/custom_textfield.dart';
import 'package:prologic_29/utils/styles/app_textstyles.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/appcolors.dart';
import 'Get_in_touch.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
              Column(children: <Widget>[
                CustomButton(
                  text: 'Send Message',
                  onPressed: () {
                    makePostRequest();
                  },
                ),
                SizedBox(
                  height: 2.0.h,
                ),
                CustomButton(
                  text: 'Google Map',
                  onPressed: () {
                    //  makePostRequest();
                  },
                ),
                // ButtonTheme(
                //     height: 70,
                //     minWidth: 100,
                //     disabledColor: const Color.fromARGB(255, 1, 10, 18),
                //     child: ElevatedButton(
                //       child: const Text("GOOGLE MAP"),
                //       onPressed: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const MapSample()));
                //         //  var url = Uri.parse(
                //         // "https://www.google.com/maps/d/viewer?mid=1_xJhYeS2A83UaCE9C2gVhCnWijI&hl=en_US&ll=53.30462100000002%2C-6.328125&z=17");
                //       },
                //     )),
                SizedBox(
                  height: 2.0.h,
                ),
                InkWell(
                    onTap: () {
                      Get.to(() => Getintouch);
                    },
                    child: const Text('Get In Touch With Us'))
              ])
            ],
          ),
        ],
      )),
    );
  }

  Future<void> makePostRequest() async {
    final url = Uri.parse('http://realestate.tecrux.net/api/v1/contact');
    final headers = {"Content-type": "application/json"};
    const json =
        '{"name":"Mari Hip0ckman","email":"zoron@mailionoator.com","subject":"Reprehenderit occaec","phone":"+1 (466) 595-2178","content":"Id commodo quia volu" }';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}